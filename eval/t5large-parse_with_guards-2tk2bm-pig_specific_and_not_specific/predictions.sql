select issue_id from issue where type = "Bit"	apache-pig 
select issue_id from issue where status = "Closed" union select issue_id from issue where status = "Resolved" or status = "Patch Available"	apache-pig 
select t1.issue_id, t1.type, t1.description from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "impl"	apache-pig 
select issue_id from issue where updated_date between '2017-03-22' and '2017-03-23'	apache-pig 
select * from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id from issue where assignee = "Daniel Ward" and status = "Open"	apache-pig 
select issue_id from issue where status = "In Progress"	apache-pig 
select issue_id from issue where assignee = "John Stark" and type = "Bit"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select issue_id from issue where updated_date > "2017-03-28"	apache-pig 
select issue_id from issue where assignee = "Daniel Ward"	apache-pig 
select * from issue_attachment	apache-pig 
select issue_id, summary from issue where type = "Bit"	apache-pig 
select issue_id, description from issue where type = "Bit"	apache-pig 
select * from issue_component where component = "grant" intersect select * from issue_component where component = "parser"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id, priority from issue where type = 'Bit'	apache-pig 
select issue_id, status, resolution, summary, priority from issue where type = 'Bit' and priority = 'Major'	apache-pig 
select issue_id, type, priority from issue where status = "Open" order by type, priority	apache-pig 
select t1.field_type, t1.username from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = "0.12.1"	apache-pig 
select issue_id, type, summary, description from issue where status = "Open" and priority = "Major"	apache-pig 
select distinct assignee from issue where type = "Bug"	apache-pig 
select t1.name, count(*) from	apache-pig 
select commit_hash, message from change_set	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select count(*) from issue where type = "Improvement"	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select t1.file_path, count(*) from code_change as t1 join change_set as t2 on t1.commit_hash = t2.commit_hash group by t1.file_path order by count(*) desc limit 5	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee order by count(*) desc limit 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee	apache-pig 
select status, count(*) from issue group by status	apache-pig 
select resolution, count(*) from issue group by resolution	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Duplicate'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Blocker'	apache-pig 
select count(*) from issue where status = "Open"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select assignee, count(*) from issue where status = "Resolved" group by assignee	apache-pig 
select display_name, message from issue_comment where issue_id = "PIG-3599"	apache-pig 
select t1.assignee_username from issue_comment as t2 join code_change as t3 on t1.issue_id = t3.issue_id	apache-pig 
select count(distinct assignee) from issue_component as t1 join issue as t2 on t1.issue_id = t2.issue_id where t1.component = "impl"	apache-pig 
select distinct assignee from issue_component as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t3.issue_id = t2.issue_id	apache-pig 
select t1.reporter, t2.issue_id from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id where t1.reporter = "null" order by t1.reporter asc	apache-pig 
select distinct field from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = "0.12.1"	apache-pig 
select issue_id, assignee from issue where resolved_date between "2014-09-08" and "2014-09-12"	apache-pig 
select t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.commit_hash = t2.fix_version where t2.fix_version = "0.12.1"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select issue_id from issue where created_date = "2017-03-28"	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select count(*), assignee from issue where resolved_date between '2015-03-01' and '2015-03-31' group by assignee having count(*) >= 3	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select * from issue where created_date > "2017-05-31"	apache-pig 
select issue_id from issue where resolved_date	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between '2013-11-28' and '2013-11-28' order by type, priority	apache-pig 
select issue_id, status from issue where type = "Bit"	apache-pig 
select issue_id, resolution from issue where type = 'Bit'	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = "PIG-3599"	apache-pig 
select * from issue_attachment	apache-pig 
select distinct t1.priority from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select distinct status from issue_changelog as t1 join jira_repository as t2 on t1.source_	apache-pig 
select count(distinct issue_id) from issue	apache-pig 
select commit_hash from change_set	apache-pig 
select distinct t2.author_email from change_set as t1 join	apache-pig 
select distinct component from issue_component	apache-pig 
select issue_fix_version	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select status from issue order by created_date_zoned desc limit 1	apache-pig 
select fix_version from issue_fix_version where issue_id = "PIG-3599"	apache-pig 
select created_date, count(*) from issue group by created_date	apache-pig 
select updated_date, count(*) from issue group by updated_date	apache-pig 
select resolved_date, count(*) from issue group by resolved_date	apache-pig 
select committed_date, count(*) from change_set group by committed_date	apache-pig 
select resolved_date, issue_id from issue where assignee = "Daniel Ward" order by resolved_date desc	apache-pig 
select count(*) from issue where resolved_date between "2014-10-01" and "2014-10-31" and assignee = "John Stark"	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select created_date, count(*) from issue group by created_date_zoned order by count(*) desc limit 1	apache-pig 
select resolved_date, count(*) from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select count(*) from issue where issue_id in ( select issue_id from issue_changelog where from_string = "Pig")	apache-pig 
select count(distinct type) from issue	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(distinct priority) from issue	apache-pig 
select priority, count(*) from issue group by priority	apache-pig 
select count(distinct status) from issue	apache-pig 
select resolution, count(*) from issue group by resolution	apache-pig 
select count(distinct assignee) from issue	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select assignee_username, count(*) from issue group by assignee_username	apache-pig 
select count(distinct reporter_username) from issue	apache-pig 
select username, count(*) from issue_comment group by username	apache-pig 
select t1.reporter_username, count(*) from issue as t1 join git_repository as t2 on t1.issue_id = t2.issue_id	apache-pig 
select count(*), t1.reporter_username from issue as t1 join git_repository as t2 on t1.issue_id = t2.git_repository_id group by t1.reporter_username	apache-pig 
select reporter_username, count(*) from issue group by reporter_username	apache-pig 
select count(*) from change_set	apache-pig 
select count(distinct author) from change_set	apache-pig 
select t1.display_name, count(*) from issue_comment as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.field = "Comment" group by t1.display_name	apache-pig 
select distinct username from issue_comment	apache-pig 
select count(distinct component) from issue_component where component = "Pig"	apache-pig 
select t1.component, count(*) from issue_component as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.component	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select name, count(*) from git_repository group by name	apache-pig 
select count(*) from issue where type = "Bit"	apache-pig 
select distinct assignee from issue	apache-pig 
select distinct assignee_username from issue	apache-pig 
select distinct reporter from issue	apache-pig 
select distinct reporter_username from issue	apache-pig 
select distinct author from change_set	apache-pig 
select display_name, count(*) from issue_comment where issue_id = "PIG-3592"	apache-pig 
select t1.issue_id, t1.created_date, t1.resolved_date, t2.commit_hash from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_	apache-pig 
select * from issue_link where source_issue_id in (select target_issue_id from change_set	apache-pig 
select count(*) from issue where issue_id not in (select issue_id from issue_link	apache-pig 
select count(*) from issue_link where source_issue_id = t1.issue_id and target_issue_id = t2.target_issue_id	apache-pig 
select count(*) from issue_link where issue_id in (select issue_id from change_set	apache-pig 
select username, count(distinct issue_id) from issue_comment group by username	apache-pig 
select issue_id, count(distinct username) from issue_comment group by issue_id	apache-pig 
select issue_id, count(*) from issue_comment group by issue_id	apache-pig 
select issue_id, summary, description from issue	apache-pig 
select t1.commit_hash from code_change as t1 join issue as t2 on t1.change_type = t2.fr	apache-pig 
select count(*), type from issue group by type	apache-pig 
select count(*) from issue_attachment where issue_id = "PIG-3599"	apache-pig 
select min(*) from code_change as t1 join issue_link as t2 on t1.commit_hash = t2.source_issue_id join issue as t3 on t2.target_issue_id = t3.issue_id where t3.type = 'Bug'	apache-pig 
select count(*) from issue_link where source_issue_id = (select t1.source_issue_id from issue_link as t1 join	apache-pig 
select source_issue_id, target_issue_id from issue_link where type = 'Bitterness'	apache-pig 
select distinct t1.name from issue_link as t1 join issue_component as t2 on t1.source_issue_id = t2.source_issue_id	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes" group by t1.issue_id	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select distinct type from issue	apache-pig 
select issue_id from issue where type = "Bit"	apache-pig 
select issue_id from issue where status!= "In Progress"	apache-pig 
select count(*) from issue_link as t1 join issue as t2 on t1.source_issue_id = t2.issue_id where t2.type = 'Improvement' group by t1.source_issue_id order by count(*) desc limit 1	apache-pig 
select issue_id from issue where issue_id not in ( select issue_id from issue_fix_version )	apache-pig 
select status from issue where status = "Closed" union select status from issue where status = "Resolved"	apache-pig 
select t1.issue_id, t1.type, t1.description from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "impl"	apache-pig 
select issue_id from issue where updated_date between '2017-03-22' and '2017-03-23'	apache-pig 
select * from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id from issue_attachment where assigne	apache-pig 
select issue_id, status from issue where status = 'Active'	apache-pig 
select issue_id from issue_comment where display_name = "John Stark"	apache-pig 
select issue_id from issue where priority = "Blocking" or priority = "Critical"	apache-pig 
select issue_id from issue where created_date > "2017-03-28"	apache-pig 
select distinct t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.assignee = "Daniel Ward"	apache-pig 
select issue_id from issue_attachment	apache-pig 
select issue_id, summary from issue where type = "Bit"	apache-pig 
select issue_id, description from issue where type = "Bit"	apache-pig 
select issue_id from issue_component where component = "grant" intersect select issue_id from issue_component where component = "parser"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
apache	apache
select issue_id, status, resolution, summary, description from issue where type = 'Major'	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = 'Major'	apache-pig 
select t1.	apache-pig 
select issue_id, type, summary, description from issue where status = "Open" and priority = "Major"	apache-pig 
select distinct assignee_username from issue where type = "Bit"	apache-pig 
select count(*), author from change_set group by author	apache-pig 
select commit_hash, message from change_set	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select count(*) from issue where type = 'Increment'	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc limit 5	apache-pig 
select assignee_username from issue group by assignee_username having count(*) = 1	apache-pig 
select assignee, count(*) from issue group by assignee order by count(*) desc limit 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(*), resolution from issue group by resolution	apache-pig 
select distinct t1.name from issue_link as t1 join issue_component as t2 on t1.source_issue_id = t2.target_issue_id	apache-pig 
select issue_	apache-pig 
select count(*) from issue where status!= "Resolved"	apache-pig 
select issue_id, priority from issue where priority = "Critical" union select issue_id, priority from issue where priority = "Blocking"	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select t2.assignee_username, t3.message from issue as t1 join issue_comment as t2	apache-pig 
select assignee from issue where issue_id = "PIG-3592"	apache-pig 
select count(distinct assignee) from issue_component as t1 join issue as t2 on t1.issue_id = t2.issue_id where t1.component = "impl"	apache-pig 
select distinct t1.assignee_username from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "imp"	apache-pig 
select t1.username, t2.issue_id from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.source_issue_	apache-pig 
select count(*) from issue_fix_version where fix_version = "0.12.1"	apache-pig 
select issue_id, assignee from issue where resolved_date between "2014-09-08" and "2014-09-12"	apache-pig 
select t1.file_path from issue_change	apache-pig 
select issue_id from issue_comment where created_date < "2014-09-12"	apache-pig 
select issue_id from issue_comment where created_date = "2017-03-28"	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select t1.reporter_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.created_date > "2015-03-31" and t1.resolved_date <= "2015-03-05" group by t1.reporter_username having count(*) >= 3	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select issue_id from issue_comment where created_date > "2017-05-31"	apache-pig 
select issue_id from issue where resolved_date between 2017-10-06	apache-pig 
select issue_id from issue_comment where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between '2013-11-28' and '2013-11-28' order by type, priority	apache-pig 
select t1.issue_id, t1.status from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.type = "Bit" and t2.from_string = "Pig"	apache-pig 
select issue_id, resolution from issue where type = "Bit"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = "PIG-3599"	apache-pig 
select * from issue	apache-pig 
select priority from issue group by priority order by count(*) desc limit 1	apache-pig 
select status from issue group by status having count(*) >= 1	apache-pig 
select distinct resolution from issue	apache-pig 
select commit_hash from change_set where git_repository_	apache-pig 
select t2.author from change_set as t1 join issue_comment as t3 on t1.commit_hash = t3.	apache-pig 
select component from issue_component where component = "Pig"	apache-pig 
select count(*), t1.fix_version from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.status = "Resolved" group by t1.fix_version	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select status from issue order by created_date_zoned desc limit 1	apache-pig 
select fix_version from issue_fix_version where issue_id = "PIG-3599"	apache-pig 
select issue_id, created_date_zoned from issue group by created_date_zoned	apache-pig 
select updated_date, created_date_zoned from issue group by created_date_zoned	apache-pig 
select resolved_date, count(*) from issue where resolution!= "Yes" group by resolved_date	apache-pig 
select count(*), committed_date from change_set group by committed_date	apache-pig 
select resolved_date, issue_id from issue where assignee = "Daniel Ward" order by resolved_date desc	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.display_name = "John Stark" and t1.resolved_date = "October 2014"	apache-pig 
select count(*) from issue_comment where created_date_zoned like "2015%"	apache-pig 
select created_date from issue_comment group by created_date order by count(*) desc limit 1	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select count(*) from issue	apache-pig 
select count(distinct type) from issue	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(*), priority from issue group by priority	apache-pig 
select count(distinct status) from issue	apache-pig 
select distinct resolution from issue_changelog as t1 join jira_repository as t2 on t1.source_issue_	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select assignee, count(*) from issue as t1 join jira_repository as t2 on t1.	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select count(*), assignee_username from issue group by assignee_username	apache-pig 
select count(*), t1.reporter_username from issue as t1 join jira_repository as t2 on t1.issue_id = t2.	apache-pig 
select count(*), username from issue_comment group by username	apache-pig 
select count(*), t1.reporter_username from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.reporter_username	apache-pig 
select count(*) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.field = "reporter"	apache-pig 
select t2.name, count(*) from issue as t1 join	apache-pig 
select count(*) from change_set	apache-pig 
select count(*) from change_set	apache-pig 
select count(*), t1.username from issue_comment as t1 join change_set as t2 on t1.issue_id = t2.issue_id	apache-pig 
select distinct username from issue_comment	apache-pig 
select count(*) from issue_component where component = "Pig"	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select count(*) from issue_link group by count(*)	apache-pig 
select count(*) from issue where type = "Bit"	apache-pig 
select distinct assignee_username from issue	apache-pig 
select distinct assignee_username from issue	apache-pig 
select distinct reporter from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.is_containment = 1	apache-pig 
select distinct t1.reporter_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.reporter_username = "null"	apache-pig 
select distinct author from change_set	apache-pig 
select count(*) from issue_comment where issue_id = "PIG-3592" group by username	apache-pig 
select t1.issue_id, t1.created_date, t1.resolved_date, t2.commit_hash, t2.committed_date from issue as t1 join issue_comment as t2	apache-pig 
select issue_id from issue_link	apache-pig 
select count(*) from change_set where commit_hash not in ( select t1.commit_hash from change_set as t1 join issue_link as t2 on t1.git_repository_id = t2.source_issue_id )	apache-pig 
select count(*) from change_set	apache-pig 
select count(*) from issue_link group by issue_id	apache-pig 
select username, count(*) from issue_comment group by username	apache-pig 
select count(distinct username) from issue_comment	apache-pig 
select issue_id, count(*) from issue_comment group by issue_id	apache-pig 
select issue_id, summary, description from issue	apache-pig 
select t1.commit_hash from code_change as t1 join issue_comment as t2 on t1.commit_hash = t2.f	apache-pig 
select count(*), t1.type from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t1.type = "Bit" group by t1.type	apache-pig 
select count(distinct t2.file_path) from issue_link as t1 join code_change as t2 on t1.source_issue_id = t2.source_issue_id	apache-pig 
select min(*) from issue_attachment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = "Bit"	apache-pig 
select count(*) from issue_link where source_issue_id in ( select t1.source_issue_id from issue_link as t1 join issue as t2 on t1.target_issue_id = t2.issue_id where t2.type = 'Bit' intersect select t1.source_issue_id from issue_link as t1 join issue as t2 on t1.target_issue_id = t2.issue_id where t2.type = 'Infrastructure' )	apache-pig 
select issue_id from issue where type = "Bitter" intersect select issue_id from issue_link	apache-pig 
select distinct name from issue_link	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Cloners" group by t1.type	apache-pig 
select distinct t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Cloners"	apache-pig 
select type from issue group by type having count(*) >= 1	apache-pig 
select * from issue as t1 join jira_repository as t2 on t1.source_issue_	apache-pig 
select issue_id from issue where status!= "In Progress"	apache-pig 
select count(*) from issue_attachment as t1 join code_change as t2 on t1.issue_id = t2.issue_id	apache-pig 
