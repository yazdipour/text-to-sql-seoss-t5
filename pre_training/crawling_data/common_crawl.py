from joblib import Parallel, delayed
from pyathena import connect
import pandas as pd
import datetime
import json
import os
import io
import gzip
import requests
import time

crawls = ['CC-MAIN-2021-21', 'CC-MAIN-2021-17', 'CC-MAIN-2021-10', 'CC-MAIN-2021-04', 'CC-MAIN-2020-50', 'CC-MAIN-2020-45',
            'CC-MAIN-2020-40', 'CC-MAIN-2020-34', 'CC-MAIN-2020-29', 'CC-MAIN-2020-24','CC-MAIN-2020-16']


def build_query(website_list, crawl_domain):
    """ Given a list of source URLs build a common crawl AWS query to extract ."""
    # build source SQL string list

    website_list_str = ''
    for i, website in enumerate(website_list):
        website_list_str += f" regexp_like (url, '{website}.*(kpi|revenue|metrics|return|order|session|(gross%profit)|(gross%revenue)|(net%profit)|(net%revenue)|conversion).*')"
        website_list_str += ' or '
    return("""
    SELECT
        url,
        url_host_registered_domain,
        fetch_time,
        fetch_status,
        warc_filename,
        warc_record_offset,
        warc_record_length,
        warc_segment,
        crawl
    FROM "ccindex"."ccindex"    
    WHERE crawl in ('{}')
      AND subset = 'warc'
      AND ({})
    """.format(crawl_domain, website_list_str[:-3 ]))


def athena_query_to_df(query, credentials_path):
    """ Given an Athena SQL query create AWS credentials return a pd.DataFrame. """
    # AWS access credentials.
    credentials = pd.read_csv(credentials_path, encoding='utf-8')
    AWS_ACCESS_KEY_ID = credentials['Access key ID'][0]
    AWS_SECRET_ACCESS_KEY = credentials['Secret access key'][0]
    S3_STAGING_DIR = credentials['staging path'][0]
    REGION_NAME = credentials['region'][0]

    # Build connection.
    conn = connect(aws_access_key_id=AWS_ACCESS_KEY_ID,
                   aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
                   s3_staging_dir=S3_STAGING_DIR,
                   region_name=REGION_NAME)
    # Query DataFrame.
    return pd.read_sql(query, conn)

def format_time(elapsed):
    """ Formats time elapsed as hh:mm:ss. """
    return str(datetime.timedelta(seconds=int(round((elapsed)))))

def query_cc_athena(credentials_path, website_list, crawl_domain, cc_metadata_path):
    """ Query Athena and build df of common crawl metadata for specific website. """
    # Query Athena
    # df path.
    if not os.path.exists(cc_metadata_path):
        print('querying athena')
        query = build_query(website_list, crawl_domain)
        df = athena_query_to_df(query=query, credentials_path=credentials_path)
        print(f'writing df to csv: {cc_metadata_path}')
        df = df.drop_duplicates(subset=['url'], keep='last')
        df.to_csv(cc_metadata_path)
    else:
        print(f'reading df from csv: {cc_metadata_path}')
        df = pd.read_csv(cc_metadata_path, index_col=0)
    return df

def download_single_result(result):
    """Downloads HTML for single search result.
    Args:
        result: Common Crawl Index search result from the search function.
    Returns:
        The provided result, extendey by the corresponding HTML String.
    """
    offset, length = int(result["offset"]), int(result["length"])

    offset_end = offset + length - 1
    url = "https://commoncrawl.s3.amazonaws.com/{filename}".format(filename=result["filename"])
    response = (requests
                .get(
                    url,
                    headers={"Range": f"bytes={offset}-{offset_end}"},
                    timeout=1.0
    ))

    zipped_file = io.BytesIO(response.content)
    unzipped_file = gzip.GzipFile(fileobj=zipped_file)

    raw_data: bytes = unzipped_file.read()
    try:
        data: str = raw_data.decode("utf-8")
    except UnicodeDecodeError:
        print(f"Warning: Could not extract file downloaded from {url}")
        data = ""

    result["html"] = ""

    if len(data) > 0:
        data_parts = data.strip().split("\r\n\r\n", 2)
        result["html"] = data_parts[2] if len(data_parts) == 3 else ""

    return result

def process_warc_query(cc_html_path, metadata):
    """ Process warc file. """
    try:
        metadata['fetch_time'] = str(metadata['fetch_time'])
        with open(cc_html_path, 'a+') as f:
            request = {
                "offset": metadata['warc_record_offset'],
                "length": metadata['warc_record_length'],
                "filename": metadata['warc_filename']
            }
            html = download_single_result(request)['html']
            webpage = {
                'metadata': metadata,
                'html': html
            }
            f.write(json.dumps(webpage) + '\n')
    except:
        print(f'failing on: {metadata}')


def run_build_corpus(credentials_path, website_list, crawl_domain, cc_metadata_path, cc_html_path, cores=1, max_docs=100000):
    """ Process all recipes in query. """
    if not os.path.exists(cc_html_path):
        start_metadata = time.time()
        # Build DataFrame of all web pages in website within common crawl
        df = query_cc_athena(credentials_path=credentials_path,
                             website_list=website_list,
                             crawl_domain=crawl_domain,
                             cc_metadata_path=cc_metadata_path)

        print("for: {} ".format(crawl_domain))
        print(f'len of dataframe is: {len(df)}')
        print(df.groupby('url_host_registered_domain')['url'].count())
        end_metadata = time.time()
        print('-> time to build common crawl metdata: {:.2f}s'.format(end_metadata-start_metadata))
        print('-> time / webpage: {:.2f}s\n'.format((end_metadata - start_metadata)/len(df)))

        # Reduce df to 'max_docs' per website.
        if max_docs:
            print(f'-- selecting {max_docs} urls from each website --')
            df_website_list = []
            for website in set(df['url_host_registered_domain'].to_list()):
                df_website = df[df['url_host_registered_domain'] == website].head(max_docs)
                df_website_list.append(df_website)
            df = pd.concat(df_website_list)
            print(f'len of dataframe is: {len(df)}')
            print(df.groupby('url_host_registered_domain')['url'].count())

        # Crawl web pages.
        Parallel(n_jobs=cores)(delayed(process_warc_query)(cc_html_path=cc_html_path,
                                                           metadata=metadata.to_dict()) for i, metadata in df.iterrows())
        end_html = time.time()
        print('-> time to build html dump: {:.2f}s'.format(end_html-end_metadata))
        print('-> time / webpage: {:.2f}s\n'.format((end_html - end_metadata)/len(df)))

    else:
        print(f'cc_html_path already exist (will not re-build!): {cc_html_path}')

e_commerce_domains = ['https://www.bigcommerce.co.uk/',
        'https://www.yotpo.com/blog/',
        'https://www.shopify.com/blog/',
        'https://www.printful.com/blog/',
        'https://www.sierrasixmedia.co.uk/',
        'https://www.businessnewsdaily.com/',
        'https://baremetrics.com/blog/',
        'https://www.investopedia.com/',
        'https://www.zoho.com/books/guides/',
        'https://corporatefinanceinstitute.com/resources/',
        'https://woocommerce.com/',
        'https://www.practicalecommerce.com/',
        'https://bootstrappingecommerce.com/',
        'https://www.abetterlemonadestand.com/blog/',
        'https://commonthreadco.com/blogs/',
        'https://www.ecommerceceo.com/blog/',
        'https://www.digitalcommerce360.com/',
        'https://www.ecommercebytes.com/blogs/',
        'https://sleeknote.com/blog',
        'https://www.privy.com/blog',
        'https://www.ecommercefuel.com/ecommerce-blog/',
        'https://mywifequitherjob.com/blog/',
        'https://www.oberlo.co.uk/blog',
        'https://www.yieldify.com/blog/',
        'https://blog.hubspot.com/',
        'https://www.seobythesea.com/',
        'https://sumo.com/stories',
        'https://optinmonster.com/blog/',
        'https://www.masterclass.com/articles/',
        'https://www.accountingtools.com/articles/',
        'https://www.americanexpress.com/en-gb/business/trends-and-insights/articles/',
        'https://smallbusiness.chron.com/',
        'https://www.dryrun.com/blog/',
        'https://www.sage.com/en-us/blog/',
        'https://www.wix.com/blog/',
        'https://www.zendesk.com/blog/',
        'https://buffer.com/resources/',
        'https://blog.hubspot.com/',
        'https://neilpatel.com/blog/',
        'https://moz.com/blog',
        'https://www.smartpassiveincome.com/blog/',
        'https://www.helpscout.com/blog/',
        'https://www.nerdmarketing.com/',
        'https://www.referralcandy.com/blog/',
        'https://getmatcha.com/blog/',
        'https://www.ecwid.com/blog/',
        'https://getshogun.com/blog/',
        'https://prisync.com/blog/',
        'https://www.storegrowers.com/blog/',
        'https://unicommerce.com/blog/',
        'https://www.granify.com/blog/',
        'https://econsultancy.com/',
        'https://blog.miva.com/',
        'https://jilt.com/blog/',
        'https://growave.io/blog/',
        'https://www.volusion.com/blog/',
        'https://business.adobe.com/blog/',
        'https://consulterce.com/blog/',
        'https://insights.jumper.ai/',
        'https://www.repricerexpress.com/blog/',
        'https://www.ecomdash.com/blog/',
        'https://ecommercenews.eu/',
        'https://www.gorgias.com/blog/',
        'https://blog.refersion.com/',
        'https://www.hotjar.com/blog/',
        'https://cm-commerce.com/category/blog/',
        'https://www.vinculumgroup.com/blog/',
        'https://trellis.co/blog/']

if __name__ == "__main__":

    for i, crawl in enumerate(crawls):
        i = i+8
        run_build_corpus("/home/gabisoare01971/datasaur/credentials.csv",e_commerce_domains, crawl, "/home/gabisoare01971/datasaur/metadata"+str(i)+".csv", "/home/gabisoare01971/datasaur/html"+str(i)+".json")