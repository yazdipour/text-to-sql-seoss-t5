select issue_id from issue where type = "Georgia"	apache-pig 
select issue_id from issue group by issue_id order by count(*) asc	apache-pig 
select issue_id from issue where type = "Georgia"	apache-pig 
select issue_id from issue where type = "buggy"	apache-pig 
select issue_id from issue where type = "Georgia"	apache-pig 
select issue_id from issue where type = "Georgia"	apache-pig 
select issue_id from issue where type = "Bug"	apache-pig 
select issue_id from issue where status = "Closed" or status = "Resolved"	apache-pig 
select issue_id, resolved_date from issue where resolution = "Resolved" or status = "Patch available"	apache-pig 
select * from issue where status = "Closed" or status = "Resolved"	apache-pig 
select issue_id from issue where resolved_date = (select resolved_date from issue where status = 'Resolved' or status = 'Patch available')	apache-pig 
select * from issue where status = "Closed" and status = "Resolved" union select * from issue where status = "Patch available" and status = "Closed"	apache-pig 
select issue_id from issue where status = "Closed" and status = "Resolved" union select issue_id from issue where status = "Patch available" and status = "Closed"	apache-pig 
select issue_id from issue where status = "Cancelled" or status = "Resolved"	apache-pig 
select issue_id, type, description from issue_component where component = "impl"	apache-pig 
select issue_id, type, description from issue_component where component = 'impl'	apache-pig 
select issue_id, type, description from issue_component where component = 'impl'	apache-pig 
select issue_id, type, description from issue_component where component = 'impl'	apache-pig 
select issue_id, type, description from issue_component where component = "impl"	apache-pig 
select issue_id, type, description from issue_component where component = "impl"	apache-pig 
select issue_id, type, description from issue_component where component = 'impl'	apache-pig 
select issue_id from issue where updated_date between 2017-03-22 and 2017-03-22	apache-pig 
select issue_id from issue where updated_date = '2017-03-22' intersect select issue_id from issue where updated_date = '2017-03-23'	apache-pig 
select issue_id from issue where updated_date between '2017-03-22' and '2017-03-23'	apache-pig 
select issue_id from issue where created_date > '2017-03-22' intersect select issue_id from issue_fix_version where created_date < '2017-03-23'	apache-pig 
select issue_id from issue where updated_date between '2017-03-22' and '2017-03-23'	apache-pig 
select issue_id from issue where updated_date = '2017-03-22' intersect select issue_id from issue where updated_date = '2017-03-23'	apache-pig 
select issue_id from issue where updated_date = '2017-03-22' intersect select issue_id from issue where updated_date = '2017-03-23'	apache-pig 
select * from issue where issue_id = 'PIG-3599'	apache-pig 
select t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select * from issue where issue_id = "PIG-3599"	apache-pig 
select * from issue where issue_id = "PIG-3599"	apache-pig 
select * from issue where issue_id = 'PIG-3599'	apache-pig 
select * from issue where issue_id = 'PIG-3599'	apache-pig 
select * from issue where issue_id = 'PIG-3599'	apache-pig 
select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" and t2.status = "Open"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" and t3.status = "Open"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee_	apache-pig 
select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.assignee = 'Daniel Ward' and t2.status = 'Open'	apache-pig 
select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.assignee = 'Daniel Ward' and t2.status = 'Open'	apache-pig 
select t1.issue_id from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id join display_name as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" and t2.status = "Open"	apache-pig 
select status from issue where status = "In Progress"	apache-pig 
select status from issue where status!= "In Progress"	apache-pig 
select distinct t1.issue_id from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.name = "Working"	apache-pig 
select status from issue group by status having count(*) >= 1	apache-pig 
select status from issue where status = "In Progress"	apache-pig 
select issue_id from issue where status = "In Progress"	apache-pig 
select * from issue where status = "In Progress"	apache-pig 
select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.reporter where t3.reporter = "John Stark" and t2.type = "Gitter"	apache-pig 
select * from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.name where t3.description = "John Stark"	apache-pig 
select t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.name where t3.description = "John Stark"	apache-pig 
select *from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.name where t3.description = "John Stark"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.jira_repository where t3.reporter = "John Stark" and t3.type = "Gitter"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join reporter as t3 on t2.reporter = t3.reporter where t3.reporter = "John Stark" and t2.type = "Gitter"	apache-pig 
select t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue as t3 on t2.issue_id = t3.issue_id where t3.reporter = "John Stark" and t3.type = "Bug"	apache-pig 
select issue.issue_id from issue join issue_changelog as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field = 'Blocker' or t3.field = 'Critical'	apache-pig 
select status from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select status from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select issue_id from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select issue.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.priority = "Blocker" or t3.priority = "Critical"	apache-pig
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select issue.issue_id from issue join issue_changelog as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.priority = "Blocker" or t3.priority = "Critical"	apache-pig 
select issue_id from issue where updated_date > '2017-03-28'	apache-pig 
select * from issue where created_date > '2017-03-28'	apache-pig 
select * from issue where updated_date > '2017-03-28'	apache-pig 
select * from issue where created_date > '2017-03-28'	apache-pig 
select * from issue where updated_date > '2017-03-28'	apache-pig 
select * from issue where updated_date > '2017-03-28'	apache-pig 
apache	apache
select distinct t1.assignee from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.field = "Daniel Ward"	apache-pig 
select distinct t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join	apache-pig 
select distinct t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join	apache-pig 
select * from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.name = "Daniel Ward"	apache-pig 
select distinct t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field = "assignee"	apache-pig 
select distinct t1.assignee from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.field = "Daniel Ward"	apache-pig 
select distinct t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.field = "Daniel Ward"	apache-pig 
select distinct issue_id from issue_attachment	apache-pig 
select distinct issue_id from issue_attachment	apache-pig 
select distinct issue_id from issue_attachment	apache-pig 
select type(t1.issue_id) from issue_attachment as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Attribute"	apache-pig 
select * from issue_attachment	apache-pig 
select * from issue_attachment where field_type = "Attribute"	apache-pig 
select * from issue_attachment	apache-pig 
select issue_id, sum(summary) from issue where type = 'Bug'	apache-pig 
select issue_id, sum(summary) from issue where type = "Ghost"	apache-pig 
select issue_id, sum(summary) from issue group by issue_id	apache-pig 
select issue_id, sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum()) from issue where type = "Georgia)"	apache-pig 
select issue_id, sum(summary) from issue where type = "Georgia"	apache-pig 
select issue_id, sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum()) from issue where type = "Georgia)"	apache-pig 
select issue_id, sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum()) from issue where type = "Georgia)"	apache-pig 
select issue_id, description from issue where type = 'Bug'	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue order by issue_id, description	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select t1.name from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join field_type as t3 on t2.field_type = t3.field_type where t2.component = 'grunt' intersect select t1.name from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join field_type as t3 on t2.field_type = t3.field_type where t2.component = 'parser'	apache-pig 
select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'grunt' intersect select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'parser'	apache-pig 
select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'grunt' intersect select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'parser'	apache-pig 
select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'grunt' intersect select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'parser'	apache-pig 
select * from issue_component where component = "grunt" intersect select * from issue_component where component = "parser"	apache-pig 
select * from issue_component where component = "grunt" intersect select * from issue_component where component = "parser"	apache-pig 
select * from issue_component where component = "grunt" intersect select * from issue_component where component = "parser"	apache-pig 
select status from issue where issue_id = 'PIG-3599'	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select status from issue where issue_id = 'PIG-3599'	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id, priority from issue where type = 'Bug'	apache-pig 
select issue_id, priority from issue where type = "Georgia"	apache-pig 
select issue_id, priority from issue group by issue_id order by count(*) desc limit 1	apache-pig 
select issue_id, priority from issue where type = "Ghost"	apache-pig 
select issue_id, priority from issue where type = "Georgia"	apache-pig 
select issue_id, priority from issue where type = "Georgia"	apache-pig 
select issue_id, priority from issue where type = "Georgia"	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = 'Bug' and priority = 'Major'	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = 'Git'	apache-pig 
select issue_id, status, summary, description from issue where type = 'Git'	apache-pig 
select issue_id, status, summary, description from issue where type = "Bitcoin"	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = "Git" and priority = "Morning"	apache-pig 
select issue_id, status, resolution, summary from issue where type = "Git" intersect select issue_id, status, resolution from issue where priority = "Morning"	apache-pig 
select issue_id, status, resolution from issue where type = "Git" and priority = "Morning" order by issue_id, status, resolution	apache-pig 
select issue_id, type, priority from issue where status = 'Open' order by type, priority	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = 'Git'	apache-pig 
select issue_id, status, summary, description from issue where type = 'Git'	apache-pig 
select issue_id, status, summary, description from issue where type = "Bitcoin"	apache-pig 
select issue_id, type, priority from issue where status = "Open" order by type, priority	apache-pig 
select issue_id, type, priority from issue where status = 'Open' order by type, priority	apache-pig 
select issue_id, type, priority from issue where status = 'Open' order by type, priority	apache-pig 
select t1.username, t1.field_type from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select t1.name, t1.change_type from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.fix_version = '0.12.1'	apache-pig 
select t1.name, t1.fix_version from issue_fix_version as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select t1.name, t2.name from code_change as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select t1.name, t2.name from issue_fix_version as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.fix_version = 0.12.1 order by t1.field_type desc limit 1	apache-pig 
select t1.field_type, t2.name from issue_fix_version as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.fix_version = 0.12.1	apache-pig 
select t1.name, t2.name from issue_fix_version as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change where t1.fix_version = 0.12.1	apache-pig 
select issue_id, type, summary, description from issue where status = 'Open' and priority = 'Major'	apache-pig 
select issue_id, type, sum(description) from issue where priority = 'Major'	apache-pig 
select issue_id, type, summary, description from issue where status = "Open"	apache-pig 
select issue_id, type, summary, description from issue where status = "Open"	apache-pig 
select issue_id, type, sum(description) from issue where status = "Open" and priority = "Major"	apache-pig 
select issue_id, type, sum(description) from issue where status = 'Open' and priority = 'Major'	apache-pig 
select issue_id, type, summary, description from issue where status = "Open" and priority = "Morning"	apache-pig 
select distinct assignee from issue where type = 'Bug'	apache-pig 
select distinct assignee_username from issue where type = "Georgia"	apache-pig 
select distinct t1.assignee_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.type = "Git"	apache-pig 
select distinct t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.type = "Ghost"	apache-pig 
select distinct assignee from issue where type = "Bug"	apache-pig 
select distinct assignee from issue where type = "Georgia"	apache-pig 
select distinct assignee from issue where type = "Git"	apache-pig 
select t1.author, count(*) from change_set as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t1.author	apache-pig 
select count(*), t1.name from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), git_repository_id from issue_comment group by git_repository_id	apache-pig 
select t1.name, count(*) from author as t1 join commit_hash as t2 on t1.name = t2.author group by t2.author	apache-pig 
select t1.author, count(*) from change_set as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t1.author	apache-pig 
select t1.name, count(*) from issue_comment as t1 join change_set as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select commit_hash, message from change_set	apache-pig 
select issue_id, message from issue_comment	apache-pig 
select t1.git_repository_id, t2.description from git_repository as t1 join issue as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change	apache-pig 
select commit_hash, message from change_set	apache-pig 
select commit_hash, message from commit_hash	apache-pig 
select commit_hash, message from change_set	apache-pig 
select commit_hash, message from change_set	apache-pig 
select t1.assignee from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3599"	apache-pig 
select t1.assignee_username from issue as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3599"	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select t1.assignee from issue as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select t1.assignee_username from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3599"	apache-pig 
select count(*) from issue where type = 'Improvement'	apache-pig 
select count(*) from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id join git_repository as t3 on t2.git_repository_id = t3.git_repository_id where t3.field_type = "Applicant" and t3.field_type = "PIG"	apache-pig 
select count(*) from issue where type = "Initialization"	apache-pig 
select count(*), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.type = 'Initialization'	apache-pig 
select count(*) from issue where type = "Improvement"	apache-pig 
select count(*) from issue where type = "Initialization"	apache-pig 
select count(*) from issue where type = "Improvement"	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc	apache-pig 
select t1.file_path, count(*) from code_change as t1 join commit_hash as t2 on t1.git_repository_id = t2.git_repository_id group by t1.file_path order by count(*) desc limit 5	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc limit 5	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc	apache-pig 
select t1.file_path, count(*) from code_change as t1 join commit_hash as t2 on t1.file_path = t2.file_path group by t1.file_path order by count(*) desc	apache-pig 
select t1.file_path, count(*) from code_change as t1 join commit_hash as t2 on t1.file_path = t2.file_path group by t1.file_path order by count(*) desc	apache-pig 
select t1.file_path, count(*) from code_change as t1 join commit_hash as t2 on t1.commit_hash = t2.commit_hash group by t1.file_path order by count(*) desc	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select t1.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name having count(*) = 1	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select count(*) from issue group by issue_id having count(*) = 1	apache-pig 
select assignee from issue group by assignee on issue_id = select assignee from issue group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id group by assignee on issue_id = issue_id	apache-pig 
select count(*), assignee from issue where status = "Open" group by assignee order by count(*) desc	apache-pig 
select t1.name, count(*) from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t1.name order by count(*) desc limit 1	apache-pig 
select t1.name, count(*) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee order by count(*) desc limit 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee order by count(*) desc limit 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by select assignee, count(*) from issue group by	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee	apache-pig 
select count(*), t1.assignee_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.assignee_username	apache-pig 
select count(*), t1.assignee_username from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.status = "Open" group by t1.assignee_username	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select count(*), t1.assignee from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.status = "Open" group by t1.assignee	apache-pig 
select count(*), assignee from issue where status = "Open" group by assignee	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee	apache-pig 
select status, count(*) from issue group by status	apache-pig 
select status, count(*) from issue group by status	apache-pig 
select status from issue group by status order by count(*) asc	apache-pig 
select count(*), type from issue group by type	apache-pig 
select status, count(*), t1.field_type from issue as t1 join count(*) as t2 on t1.issue_id = t2.issue_id group by t1.field_type	apache-pig 
select status, count(*) from issue group by status	apache-pig 
select status, count(*) from issue group by status	apache-pig 
select resolution, count(*) from issue group by resolution	apache-pig 
select resolution, count(*), t1.field_type from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.field_type	apache-pig 
select count(*), resolution from issue group by resolution	apache-pig 
select count(*), t1.field_type from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.field_type	apache-pig 
select t2.name, count(*) from git_repository as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t2.name	apache-pig 
select resolution, count(*) from issue group by resolution	apache-pig 
select resolution, count(*) from jira_repository where key = 'PIG' group by resolution	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Duplicate'	apache-pig 
select issue_id from issue_link where name = "Duplicate" intersect select issue_id from issue_link where name = "Duplicate"	apache-pig 
select count(*) from issue_link where outward_label = "Duplicate"	apache-pig 
select name from issue_link where name like '%duplicate%'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Duplicate'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = "Duplicate"	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Duplicate'	apache-pig 
select t1.issue_id from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Blocker"	apache-pig 
select issue_id from issue_link where outward_label = "blocks" intersect select issue_id from issue_link where outward_label = "blocks"	apache-pig 
select issue_id from issue group by issue_id having count(*) >= 2	apache-pig 
select t1.name from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = 'Blocker'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Blocker'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = "Blocker"	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Blocker'	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = 'Open'	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = "Open"	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = "Open"	apache-pig 
select count(*) from issue where status!= "Resolved"	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = "Open"	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = "Open"	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t1.status = "Open"	apache-pig 
select t1.issue_id from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t2.priority = "Blocker" or t2.priority = "Critical"	apache-pig 
select status from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select issue_id from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select distinct issue_id from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.priority = "Blocker" or t3.priority = "Critical"	apache-pig 
select assignee, count(*) from issue where status = "Resolved" group by assignee	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*), t1.assignee from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.assignee	apache-pig 
select count(*), assignee from issue where status = "Resolved" group by assignee	apache-pig 
select assignee, count(*) from issue where status = "Resolved" group by assignee	apache-pig 
select assignee, count(*) from issue where status = "Resolved" group by assignee	apache-pig 
select t1.description, t3.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id where t2.issue_id = "PIG-3599"	apache-pig 
select t1.name, t2.description from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3599"	apache-pig 
select t1.assignee, t2.Com	apache-pig 
select t2.assignee, t3.description from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t1.issue_id = t3.issue_id where t3.issue_id = 'PIG-3599'	apache-pig 
select t1.display_name, t1.me	apache-pig 
select t2.display_name, t1.message from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.issue_id = "PIG-3599"	apache-pig 
select t2.display_name, t3.message from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t1.issue_id = t3.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select t1 from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select t1.name from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3592"	apache-pig 
select t1.name from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3592"	apache-pig 
select t2.assignee from issue as t1 join assignee as t2 on t1.issue_id = t2.assignee where t1.issue_id = "PIG-3592"	apache-pig 
select * from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	 apache-pig 
select t1.name from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select distinct t1.e	apache-pig 
select count(distinct assignee) from issue_component where component = 'impl'	apache-pig 
select count(*) from issue_component where component = 'impl'	apache-pig 
select count(distinct assignee) from issue_component where component = 'impl'	apache-pig 
select count(*) from issue_component where component = 'impl'	apache-pig 
select count(distinct assignee) from issue_component where component = "impl"	apache-pig 
select count(distinct assignee) from issue_component where component = "impl"	apache-pig 
select count(distinct assignee) from issue_component where component = 'impl'	apache-pig 
select distinct t1.assignee from issue_comment as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "impl"	apache-pig 
select t1.name from issue_comment as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "impl"	apache-pig 
select t1.name from issue_comment as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "imp"	apache-pig 
select t1.assignee_username from issue_comment as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "imp"	apache-pig 
select distinct assignee from issue_component where component = 'impl'	apache-pig 
select distinct assignee from issue_component where component = 'impl'	apache-pig 
select distinct t1.assignee from issue_component as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.component = "impl"	apache-pig 
select reporter from issue order by reporter	apache-pig 
select t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select t1.name, t2.issue_id from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id where t1.field = "reporter"	apache-pig 
select t1.name, t2.issue_id from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t1.jira_repository = t3.jira_repository where t3.field_type = "PIG"	apache-pig 
select reporter, issue_id from issue order by reporter asc	apache-pig 
select reporter, issue_id from issue order by reporter	apache-pig 
select t1.reporter, t2.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id order by t1.reporter asc	apache-pig 
select distinct field from issue_fix_version where fix_version = 0.12.1	apache-pig 
select * from issue_fix_version where fix_version = 0.12.1	apache-pig 
select * from issue_fix_version where fix_version = 0.12.1	apache-pig 
select * from code_change as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select * from issue_changelog where fix_version = 0.12.1	apache-pig 
select distinct field from issue_fix_version where fix_version = 0.12.1	apache-pig 
select distinct field from issue_fix_version where fix_version = 0.12.1	apache-pig 
select issue_id, assignee from issue where resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select issue_id, assignee from issue where resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select t1.issue_id, t2.name from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.resolution = "2014-09-08" intersect select t1.issue_id, t2.name from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.resolution = "2014-09-12"	apache-pig 
select issue_id, assignee from issue where resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select issue_id, assignee from issue where resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select t1.issue_id, t2.assignee from issue as t1 join issue_comment as t2 on t1.issue_id = t2.assignee where t1.resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select issue_id, assignee from issue where resolved_date between 2014-09-08 and 2014-09-12	apache-pig 
select t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.fix_version = '0.12.1'	apache-pig 
select t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.fix_version = t2.fix_version where t2.fix_version = '0.12.1'	apache-pig 
select t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select distinct t1.filename from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select distinct t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.fix_version = '0.12.1'	apache-pig 
select t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.fix_version = t2.fix_version where t2.fix_version = 0.12.1	apache-pig 
select distinct t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.fix_version = '0.12.1'	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select status from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select issue_id from issue where created_date = '2017-03-28'	apache-pig 
select * from issue where created_date = '2017-03-28'	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select issue_id from issue where resolved_date = '2013-10-23'	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select issue_id from issue where resolved_date = '2013-10-23'	apache-pig 
select issue_id from issue where resolved_date = '2013-10-23'	apache-pig 
select issue_id from issue where resolved_date = '2013-10-23'	apache-pig 
select assignee from issue where resolved_date between '2015-03-01' and '2015-03-31' group by assignee having count(*) >= 3	apache-pig 
select t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.resolved_date >= 3 intersect select t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.resolved_date <= '2015-03-01'	apache-pig 
select t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.resolved_date between '2015-03-01' and '2015-03-31' group by t1.name having count(*) >= 3	apache-pig 
select assignee_username from issue where resolved_date between '2015-03-01' and '2015-03-31' group by assignee_username having count(*) >= 3	apache-pig 
select t1.issue_id, count(*) from issue as t1 join resolution as t2 on t1.resolved_date = t2.issue_id where t2.resolved_date between '2015-03-01' and '2015-03-31' group by t1.issue_id having count(*) >= 3	apache-pig 
select assignee, count(*) from issue group by assignee having count(*) >= 3 intersect select assignee from issue where resolved_date between '2015-03-01' and '2015-03-31'	apache-pig 
select assignee from issue group by assignee having count(*) >= 3 intersect select assignee from issue where resolved_date = '2015-03-01' and resolved_date = '2015-03-31'	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select issue_id from issue where created_date > '2017-05-31'	apache-pig 
select * from issue where created_date > '2017-05-31'	apache-pig 
select * from issue where created_date > '2017-05-31'	apache-pig 
select * from issue where created_date > '2017-05-31' and resolved_date < '2017-05-31'	apache-pig 
select * from issue where created_date > '2017-05-31'	apache-pig 
select * from issue where created_date = "2017-05-31"	apache-pig 
select * from issue where created_date > '2017-05-31'	apache-pig 
select issue_id from issue where resolved_date between (select resolved_date from issue where resolved_date between 2017-10-06 and 2017-10-31)	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-06' and '2017-10-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-01-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-01-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-01-31'	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between created_date and created_date between 2013-11-16 and 2013-11-28 order by type, priority	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between created_date and created_date between 2013-11-28 and 2013-11-28 order by type, priority	apache-pig 
select issue_id, type, priority from issue where created_date between '2013-11-16' and '2013-11-28' order by type, priority	apache-pig 
select issue_id, type, priority from issue where created_date between '2013-11-16' and '2013-11-28' order by type, priority	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between '2013-11-16' and '2013-11-28' order by type, priority	apache-pig 
select issue_id, type, priority from issue where status = 'Open' intersect select issue_id, type, priority from issue where created_date between '2013-11-16' and '2013-11-28'	apache-pig 
select issue_id, type, priority from issue where created_date between '2013-11-16' and '2013-11-28' order by t1.type, t1.priority from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where created_date between '2013-11-16' and '2013-11-28' order by t1.type, t1.priority from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where created_date between '2013-11-16' and t2.created_date between '2013-11-28'	apache-pig 
select issue_id, status from issue where type = 'Bug'	apache-pig 
select issue_id, status from issue where type = "Georgia"	apache-pig 
select issue_id, status from issue order by issue_id, status	apache-pig 
select	apache-pig 
select issue_id, status from issue where type = "Georgia"	apache-pig 
select issue_id, status from issue where type = "Georgia"	apache-pig 
select issue_id, status from issue where type = "Georgia"	apache-pig 
select issue_id, resolution from issue where type = 'Bug'	apache-pig 
select issue_id, resolution from issue order by issue_id, resolution	apache-pig 
select issue_id, resolution from issue where type = "Georgia"	apache-pig 
select	apache-pig 
select issue_id, resolution from issue where type = "Georgia"	apache-pig 
select issue_id, resolution from issue where type = "Georgia"	apache-pig 
select issue_id, resolution from issue where type = "Georgia"	apache-pig 
select type from issue where issue_id = 'PIG-3599'	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select resolution from issue where issue_id = (select resolved_date from issue where issue_id = 'PIG-3599')	apache-pig 
select resolved_date from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select t1.resolved_date from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select * from issue where t1.source_issue_id not in (select t1.source_issue_id from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t2.issue_id from issue_fix_version as t3 join issue_component as t4 on t2.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_fix_version as t5 join issue_component as t8 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_component)	apache-pig 
select * from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join git_repository as t3 on t2.git_repository_id = t3.git_repository_id	apache-pig 
select * from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.issue_id	apache-pig 
select * from issue where issue_id not in (select issue_id from issue_fix_version)	apache-pig 
select * from issue	apache-pig 
select * from issue	apache-pig 
select * from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id	apache-pig 
select distinct priority from issue	apache-pig 
select distinct priority from issue	apache-pig 
select distinct priority from git_repository	apache-pig 
select priority from issue group by priority order by count(*) asc limit 1	apache-pig 
select distinct t1.priority from issue as t1 join jira_repository as t2 on t1.jira_repository = t2.git_repository_id where t2.field_type = "PIG"	apache-pig 
select distinct priority from git_repository	apache-pig 
select distinct priority from git_repository	apache-pig 
select distinct status from issue	apache-pig 
select distinct status from issue	apache-pig 
select distinct status from issue	apache-pig 
select distinct status from issue	apache-pig 
select distinct status from issue where issue_id in (select t1.type from issue as t1 join jira_repository as t2 on t1.jira_repository = t2.jira_repository where t2.field_type = "PIG")	apache-pig 
select distinct status from issue	apache-pig 
select distinct status from issue	apache-pig 
select distinct resolution from issue	apache-pig 
select distinct resolution from issue	apache-pig 
select resolution from issue	apache-pig 
select type from issue group by type having count(*) >= 2	apache-pig 
select distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct(distinct)) from issue_changelog)	apache-pig 
select distinct resolution from issue_changelog where field = "PIG"	apache-pig 
select distinct resolution from issue	apache-pig 
select * from commit_hash	apache-pig 
select * from git_repository where git_repository_id not in (select git_repository_id from change_set)	apache-pig 
select t1.git_repository_id from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select * from commit_hash as t1 join code_change as t2 on t1.git_repository_id = t2.git_repository_id where t2.field_type = "Application"	apache-pig 
select * from commit_hash	apache-pig 
select distinct commit_hash from commit_hash	apache-pig 
select distinct t1.commit_hash from commit_hash as t1 join code_change as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select distinct t1.author_email from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id	apache-pig 
select t1 from issue_comment as t1 join code_change as t2 on t1.code_change = t2.code_change join jira_repository as t3 on t1.jira_repository = t3.code_change where t3.key = 'Application Pig'	apache-pig 
select t1.name from issue_comment as t1 join code_change as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.	apache-pig 
select t1.name from issue_comment as t1 join change_set as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change	apache-pig 
select distinct t1.e	apache-pig 
select distinct t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select distinct author_email from change_set	apache-pig 
select distinct component from issue_component	apache-pig 
select distinct component from issue_component	apache-pig 
select component from issue_component where field = "PIG"	apache-pig 
select component from issue_component where field = "PIG"	apache-pig 
select distinct component from issue_component	apache-pig 
select distinct component from issue_component	apache-pig 
select distinct component from issue_component	apache-pig 
select count(*), t1.fix_version from issue_fix_version as t1 join issue_fix_version as t2 on t1.fix_version = t2.issue_id group by t1.fix_version	apache-pig 
select t1.fix_version, count(*) from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.status = "Resolved" group by t1.fix_version	apache-pig 
select t1.fix_version, count(*) from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.status = "Resolved" group by t1.fix_version	apache-pig 
select fix_version, count(*) from issue_fix_version group by fix_version	apache-pig 
select count(*), t1.fix_version from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.resolution = 'Resolved' group by t1.fix_version	apache-pig 
select fix_version, count(*) from issue_fix_version group by fix_version	apache-pig 
select count(*), t1.fix_version from issue_fix_version as t1 join issue_fix_version as t2 on t1.fix_version = t2.fix_version group by t1.fix_version	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select status from issue order by created_date_zoned desc limit 1	apache-pig 
select status from issue order by created_date limit 1	apache-pig 
select status from issue order by created_date limit 1	apache-pig 
select status from issue order by created_date desc limit 1	apache-pig 
select status from issue group by status order by created_date_zoned desc limit 1	apache-pig 
select status from issue order by created_date_zoned desc limit 1	apache-pig 
select status from issue order by created_date_zoned desc limit 1	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select t1.fix_version from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.issue_id = (select t2.issue_id from issue_changelog as t3 join issue_fix_version as t4 on t3.issue_id = t4.issue_id where t4.status = "Resolved")	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select fix_version from issue_fix_version where issue_id = 'PIG-3599'	apache-pig 
select fix_version from issue_fix_version where issue_id = "PIG-3599"	apache-pig 
select count(*), created_date from issue group by created_date	apache-pig 
select count(*), created_date from issue group by created_date	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select issue_id, created_date, created_date_zoned from issue group by created_date_zoned	apache-pig 
select created_date, count(*) from issue group by created_date	apache-pig 
select created_date, count(*) from issue group by created_date	apache-pig 
select created_date, count(*) from issue group by created_date	apache-pig 
select count(*), t1.updated_date from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.updated_date = "2016-03-15" group by t1.issue_id	apache-pig 
select count(*), created_date from issue group by created_date_zoned	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select created_date, created_date_zoned from issue group by created_date_zoned	apache-pig 
select updated_date, count(*) from issue group by updated_date	apache-pig 
select updated_date, count(*) from issue group by updated_date	apache-pig 
select count(*), t1.updated_date from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.updated_date	apache-pig 
select count(*), resolved_date from issue group by resolved_date	apache-pig 
select count(*), resolved_date from issue group by resolved_date	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select resolved_date from issue order by resolved_date desc limit 1	apache-pig 
select resolved_date, count(*) from issue group by resolved_date	apache-pig 
select resolved_date, count(*) from issue group by resolved_date	apache-pig 
select resolved_date, count(*) from issue group by resolved_date	apache-pig 
select count(*), created_date_zoned from change_set group by created_date_zoned	apache-pig 
select count(*), t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), t1.created_date from change_set as t1 join issue as t2 on t1.committed_date = t2.committed_date group by t1.created_date	apache-pig 
select count(*), t1.created_date from change_set as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t1.created_date	apache-pig 
select committed_date, count(*) from change_set group by committed_date	apache-pig 
select count(*), t1.committed_date from change_set as t1 join issue as t2 on t1.committed_date = t2.committed_date group by t1.committed_date	apache-pig 
select count(*), t1.committed_date from issue_comment as t1 join change_set as t2 on t1.committed_date = t2.committed_date group by t1.committed_date	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.display_name = "Daniel Ward" order by t2.resolved_date desc	apache-pig 
select issue_id from issue where resolution = "Resolved" order by resolved_date_zoned desc	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join display_name as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" order by t2.resolution desc	apache-pig 
select resolved_date, issue_id from issue where assignee = "Daniel Ward" order by resolved_date	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" order by t2.resolution desc	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join assignee as t2 on t1.assignee = t2.assignee where t2.description = "Daniel Ward" order by t1.resolved_date desc	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee where t3.description = "Daniel Ward" order by t2.resolved_date desc	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue as t3 on t2.issue_id = t3.issue_id where t3.assignee = "John Stark" and t3.resolution = "Resolved"	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue as t3 on t2.issue_id = t3.issue_id where t3.display_name = "John Stark" and t3.resolution = "Resolved"	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.resolution = "John Stark" and t1.created_date like "8/%"	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id where t3.description = "John Stark" and t2.resolution = "2014-10-07"	apache-pig 
select count(*) from issue where resolved_date between 2014-10-01 and 2014-10-31 intersect select count(*) from issue where resolution = "Resolved"	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue as t3 on t2.issue_id = t3.issue_id where t3.assignee = "John Stark" and t3.resolution = "Resolved"	apache-pig 
select t1.issue_id from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.resolved_date between 2014-10-01 and 2014-10-31 intersect select t1.issue_id from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.assignee = "John Stark"	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select count(*) from issue where created_date between created_date and created_date_zoned between 2015 and 2015	apache-pig 
select count(*) from issue where created_date = "2015-03-19 15:06:20"	apache-pig 
select count(*) from issue where created_date = "2015-04-19 15:06:20" and updated_date = "2015-03-15 00:33:18"	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select created_date from issue group by created_date_zoned order by count(*) desc limit 1	apache-pig 
select created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select issue_id, created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select created_date, count(*) from issue group by created_date order by count(*) desc limit 1	apache-pig 
select created_date, count(*) from issue group by created_date order by count(*) desc	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select issue_id, count(*) from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select resolved_date, count(*) from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select resolved_date, count(*) from issue group by resolved_date order by count(*) desc	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select count(*) from git_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id group by t1.git_repository_id	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select count(*), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select count(*) from jira_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id join issue as t3 on t2.issue_id = t3.issue_id where t1.field = "PIG"	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select count(distinct type), t1.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.type	apache-pig 
select count(distinct type) from issue	apache-pig 
select count(distinct type), t1.name from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.type	apache-pig 
select count(distinct type), select count(distinct t1.type) from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id group by t1.type	apache-pig 
select count(distinct type) from issue	apache-pig 
select count(distinct type) from issue	apache-pig 
select count(distinct type), t1.name from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(distinct priority), t1.name from jira_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select priority, count(*) from issue group by priority	apache-pig 
select priority, count(*) from issue group by priority	apache-pig 
select priority, count(*) from issue group by priority	apache-pig 
select count(*), priority from issue group by priority	apache-pig 
select count(*), t1.priority from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.priority	apache-pig 
select t2.priority, count(*) from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t2.priority	apache-pig 
select priority, count(*) from issue group by priority	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(distinct status), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(distinct status) from git_repository	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(distinct resolution) from issue	apache-pig 
select count(*), t1.resolution from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.resolution	apache-pig 
select count(*), t1.type from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join resolution as t3 on t2.resolution = t3.resolution group by t1.type	apache-pig 
select resolution from jira_repository where key = 'PIG'	apache-pig 
select count(*), t1.resolution from issue as t1 join git_repository as t2 on t1.resolution = t2.git_repository_id group by t1.resolution	apache-pig 
select count(distinct resolution) from git_repository	apache-pig 
select count(distinct resolution), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(distinct assignee) from issue	apache-pig 
select count(distinct assignee) from issue	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t3.issue_id	apache-pig 
select count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
apache	apache
select count(distinct assignee), count(distinct t1.assignee) from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.field = "assignee"	apache-pig 
select count(distinct assignee) from git_repository	apache-pig 
select assignee, count(*), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join assignee as t3 on t2.assignee = t3.assignee group by t1.name	apache-pig 
select count(*), assignee from issue group by assignee	apache-pig 
select count(*), assignee from issue group by assignee	apache-pig 
select count(*) from jira_repository as t1 join code_change as t2 on t1.jira_repository = t2.jira_repository where t1.key = "PIG"	apache-pig 
select assignee, count(*), t1.name from asc limit 1	apache-pig 
select count(distinct assignee), count(distinct t1.assignee) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.assignee	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select count(*) from issue_comment as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.group_id = t3.group_id where t3.field_type = "PIG"	apache-pig 
select count(*), assignee_username from git_repository group by assignee_username	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t3.issue_id	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select count(distinct assignee_username) from git_repository	apache-pig 
select assignee_username, count(*) from assignee group by assignee_username	apache-pig 
select count(distinct assignee_username), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_changelog as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select count(*), assignee_username from issue group by assignee_username	apache-pig 
select count(*), assignee_username from issue group by assignee_username	apache-pig 
select count(*), asc limit 1	apache-pig 
select assignee_username, count(*) from issue group by assignee_username	apache-pig 
select assignee_username, count(*), t1.assignee_username from as t1 join issue_changelog as t2 on t1.assignee = t2.assignee group by t1.assignee_username	apache-pig 
select count(distinct reporter) from issue	apache-pig 
select count(distinct created_date) from issue	apache-pig 
select count(distinct reporter_username) from issue	apache-pig 
select count(*) from jira_repository as t1 join issue as t2 on t1.jira_repository = t2.jira_repository where t1.field_type = "pig"	apache-pig 
select count(distinct reporter) from issue	apache-pig 
select count(distinct reporter) from git_repository	apache-pig 
select count(distinct reporter) from issue	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join	apache-pig 
select count(*), username from	apache-pig 
apache-pig|created_date, count(*), t1.name from issue_comment as (select t1.name from issue_comment as t1 join	apache-pig|created_date, count(*), t1.name from issue_comment as (select t1.name from issue_comment as t1 join
apache-pig|created_date, count(*), t1.name, count(*) from issue_comment as (select count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment" group by t1.name)	apache-pig|created_date, count(*), t1.name, count(*) from issue_comment as (select count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment" group by t1.name)
select t2.name, count(*) from issue_comment as t1 join	apache-pig 
select count(*), t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.username	apache-pig 
select count(*), t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.username	apache-pig 
select reporter, count(*), t1.field_type from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type group by t1.field_type	apache-pig 
select reporter from issue group by reporter	apache-pig 
select count(*) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field = "journalist"	apache-pig 
select count(*), t1.reporter_username from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type group by t1.reporter_username	apache-pig 
select t1.name, count(*) from git_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id group by t1.reporter_username	apache-pig 
select reporter, count(*) from issue group by reporter	apache-pig 
select reporter, count(*), t1.field_type from field as t1 join issue_changelog as t2 on t1.field_type = t2.field_type group by t1.field_type	apache-pig 
select count(distinct reporter_username), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field = "journalist"	apache-pig 
select count(*) from issue_changelog as t1 join issue as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field ='reporter'	apache-pig 
select count(distinct t1.username) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.created_date = "2010-04-19 15:06:20"	apache-pig 
select count(*) from issue_changelog as t1 join issue as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field ='reporter'	apache-pig 
select distinct reporter_username from jira_repository	apache-pig 
select count(*), t1.reporter_username from jira_repository as t1 join issue_changelog as t2 on t1.git_repository_id = t2.git_repository_id group by t1.reporter_username	apache-pig 
select count(distinct reporter_username), t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field ='reporter'	apache-pig 
select reporter_username, count(*) from issue group by reporter_username	apache-pig 
select count(*), t1.reporter_username from jira_repository as t1 join issue_changelog as t2 on t1.field_type = t2.field_type where t1.field_type = 'journalist' group by t1.reporter_username	apache-pig 
select count(*), t1.reporter_username from jira_repository as t1 join issue_changelog as t2 on t1.git_repository_id = t2.git_repository_id group by t1.reporter_username	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select reporter_username, count(*) from issue group by reporter_username	apache-pig 
select t1.reporter_username, count(*) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field_type as t3 on t2.field_type = t3.field_type group by t1.reporter_username	apache-pig 
select reporter_username, count(*) from issue_changelog count(*) as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field ='reporter' group by t1.reporter_username	apache-pig 
select count(*), t1.name from git_repository as t1 join code_change as t2 on t1.git_repository_id = t2.git_repository_id join issue as t3 on t2.issue_id = t3.issue_id where t3.name = '%international%'	apache-pig 
select count(*), t1.name from git_repository as t1 join code_change as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), t1.name from jira_repository as t1 join code_change as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*) from change_set	apache-pig 
select count(*), t1.name from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), t1.name from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(*), t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(distinct author) from issue	apache-pig 
select count(distinct author) from change_set	apache-pig 
select count(*) from issue_comment group by issue_comment having count(*) >= 2	apache-pig 
select count(*), t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(distinct author_email) from change_set	apache-pig 
select count(distinct author_email) from change_set	apache-pig 
select count(distinct author) from change_set	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join display_name as t2 on t1.display_name = t2.display_name group by t1.display_name	apache-pig 
select count(*), t2.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join key from issue_comment as t3 on t2.key = (select t3.key from issue_comment as t4 join issue_comment as t5 on t3.issue_id = t4.issue_id join key as t5 on t4.key = t5.key)	apache-pig 
select count(*), t1.name from t1.name as t1 join issue_comment as t2 on t1.name = t2.name where t1.field_type = "Db"	apache-pig 
select count(*), t1.name from git_repository as t1 join issue_comment as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select t2.description, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.description	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.display_name	apache-pig 
select t2.description, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.description order by count(*) desc	apache-pig 
select distinct username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment"	apache-pig 
select distinct username from issue_comment	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id where t3.field_type = "Comment"	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t4.issue_id from issue_comment as t3 join issue_comment as t4 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t8	apache-pig 
select distinct username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment"	apache-pig 
select distinct username from issue_comment	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id where t3.field_type = "Comment"	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select count(*) from jira_repository as t1 join issue_component as t2 on t1.jira_repository = t2.jira_repository where t1.field_type = "PIG"	apache-pig 
select count(*) from issue_component	apache-pig 
select count(*) from jira_repository as t1 join issue_component as t2 on t1.jira_repository = t2.jira_repository where t1.key = "PIG"	apache-pig 
select count(distinct component) from issue_component where field_type = "PIG"	apache-pig 
select count(*) from issue_component where field = "Apple" and t1.field = "PIG"	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select component, t1.component from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Component"	apache-pig 
select t1.name, count(*) from issue_component as t1 join issue_component as t2 on t1.component = t2.component group by t1.component	apache-pig 
select t1.component, count(*) from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id group by t1.component	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select t1.name, count(*) from issue_component as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.component	apache-pig 
select count(*), t1.component from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id group by t1.component	apache-pig 
select count(*), t1.component from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t1.issue_id from issue_comment as t3 join issue_component as t4 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_component as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_component as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_component as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment)	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select count(distinct t1.type) from issue_link as t1 join git_repository as t2 on t1.git_repository_id = t2.git_repository_id join field_type as t3 on t1.field_type = t3.field_type where t2.field_type = 'PIG'	apache-pig 
select count(distinct issue_id) from issue_link	apache-pig 
select count(distinct issue_id) from issue_link	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select count(distinct	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select t1.name, t2.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t2.field_type = 'Link'	apache-pig 
select count(*), t1.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*), t1.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*), t1.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.name order by count(*) asc	apache-pig 
select t1.name, count(*) from git_repository as t1 join issue_link as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select t1.name, count(*) from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select t2.name, count(*) from issue_changelog as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t1.field_type = "PIG" group by t2.name	apache-pig 
select count(*) from issue where type = 'Bug'	apache-pig 
select count(*) from jira_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id where t1.field_type = "PIG"	apache-pig 
select count(*) from issue	apache-pig 
select count(*) from issue where type = "Bitcoin"	apache-pig 
select count(*) from issue where type = "Georgia"	apache-pig 
select count(*) from issue where type = "Georgia"	apache-pig 
select count(*) from issue where type = "Georgia"	apache-pig 
select distinct assignee from issue	apache-pig 
select distinct t1.assignee_username from as t1 join issue as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.field_type = t3.field_type where t3.field = 'assignee'	apache-pig 
select distinct t1.assignee_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.field_type = "assignedee"	apache-pig 
select distinct assignee_username on t1.assignee = t2.assignee	apache-pig 
select distinct assignee from issue	apache-pig 
select distinct assignee from jira_repository	apache-pig 
select distinct assignee from jira_repository	apache-pig 
select distinct assignee_username from issue	apache-pig 
select distinct t1.name from issue_comment as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.assignee = 1	apache-pig 
select distinct assignee_username from assignee	apache-pig 
select distinct t1.assignee_username from issue_comment as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.field_type = "assignedee"	apache-pig 
select distinct assignee_username from	apache-pig 
select distinct assignee_username on t1.assignee_username = t2.assignee_username	apache-pig 
select distinct assignee_username from issue	apache-pig 
select distinct reporter_username from issue	apache-pig 
select distinct t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id	apache-pig 
select distinct t1.reporter_username from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t1.created_date = "2016-04-19 15:06:20" and t3.field_type = "Duplicate"	apache-pig 
select distinct reporter from issue	apache-pig 
select distinct reporter from issue	apache-pig 
select distinct reporter from jira_repository	apache-pig 
select distinct reporter_username from jira_repository	apache-pig 
select distinct reporter_username from issue_changelog as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join field as t3 on t2.field_type = t3.field_type where t3.field = "journalist"	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id join issue_component as t4 on t3.issue_id = t4.issue_id where t4.field_type = "reporter"	apache-pig 
select distinct reporter_username from issue_changelog	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id where t3.issue_id in (select t3.issue_id from issue_comment as t4 join issue_comment as t5 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment	apache-pig 
select distinct reporter_username from issue_changelog	apache-pig 
select distinct reporter_username on jira_repository = t1.key.jira_repository where t1.field_type = "reporter"	apache-pig 
select distinct reporter_username from issue_changelog	apache-pig 
select distinct author_email from change_set	apache-pig 
select distinct t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select distinct t1.name from issue_comment as t1 join change_set as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id group by t1.issue_id having count(*) >= 2	apache-pig 
select distinct t1.name from jira_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select count(distinct author_email) from change_set	apache-pig 
select distinct author from change_set	apache-pig 
select distinct author_email from change_set	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.issue_id = 'PIG-3592' group by t1.issue_id	apache-pig 
select count(*) from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3592"	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592' group by t1.name	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.issue_id = 'PIG-3592' group by t1.issue_id	apache-pig 
select count(*), t1.display_name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592' group by t1.display_name	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.issue_id = 'PIG-3592' group by t2.display_name	apache-pig 
select issue_id, created_date, resolved_date from issue order by resolved_date - created_date asc limit 1	apache-pig 
select issue_id, created_date, resolved_date, commit_hash from issue group by issue_id	apache-pig 
select issue_id, created_date, resolved_date, commit_hash from issue group by issue_id	apache-pig 
select t1.issue_id, t1.created_date, t1.resolved_date from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.status = "Resolved" group by t1.issue_id	apache-pig 
select issue_id, created_date, resolved_date, commit_hash from issue_link join code_change as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.status = "Resolved" intersect select issue_id, created_date, resolved_date from issue_comment as t1 join code_change as t2 on t1.issue_id = t2.issue_id where t2.status = "Committed"	apache-pig 
select issue_id, created_date, resolved_date from issue_link as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t1.code_change = t3.code_change where t3.status = "Resolved"	apache-pig 
select t1.issue_id, t1.created_date, t1.resolved_date from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id where t2.change_set = 'Committed'	apache-pig 
select distinct t1.issue_id from issue_link as t1 join change_set as t2 on t1.issue_id = t2.issue_id	apache-pig 
select distinct t1.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select issue_id from issue_link group by issue_id having count(*) >= 1	apache-pig 
select issue_id from issue_link except select t1.issue_id from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select distinct t1.name from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.issue_id having count(*) >= 1	apache-pig 
select distinct t1.name from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change where t3.field_type = "Link"	apache-pig 
select * from issue_link	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_link )	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_comment )	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id not in ( select issue_id from issue_link where issue_id from) )	apache-pig 
select count(*) from issue_comment where issue_id not in ( select issue_id from issue_link )	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_link )	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_link )	apache-pig 
select count(*) from issue where issue_id not in ( select issue_id from issue_link )	apache-pig 
select count(*) from issue group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue_comment group by issue_id having count(*) >= 2	apache-pig 
select count(*) from issue group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue_link as t1 join code_change as t2 on t1.issue_id = t2.issue_id group by t1.issue_id having count(*) >= 2	apache-pig 
select count(*) from issue_link group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue_link group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue_link group by issue_id having count(*) = 1	apache-pig 
select count(*) from issue group by count(*) having count(*) = 1	apache-pig 
select count(*) from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.issue_id having count(*) = 1	apache-pig 
select t1.issue_id from issue_link as t1 join code_change as t2 on t1.issue_id = t2.issue_id group by t1.issue_id having count(*) = 1	apache-pig 
select count(*) from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id group by t1.issue_id having count(*) = 1	apache-pig 
select count(*) from issue_link group by issue_id having count(*) = 1	apache-pig 
select count(*) from issue_link group by count(*)	apache-pig 
select username, count(distinct issue_id) from issue_comment group by username	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment" group by t1.issue_id	apache-pig 
select t2.name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.name	apache-pig 
select t2.name, count(distinct t1.issue_id) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.name	apache-pig 
select t2.name, count(distinct t1.issue_id) from issue_comment as t1 join username as t2 on t1.issue_id = t2.issue_id group by t2.name	apache-pig 
select count(*), t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.field = "Comment" group by t1.username	apache-pig 
select t1.issue_id, count(distinct t1.username) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select count(*) from issue_comment	apache-pig 
select count(*), t1.name from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.field_type = "Comment" group by t1.name	apache-pig 
select count(*), t1.name from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.name	apache-pig 
select issue_id, count(distinct username) from issue_comment group by issue_id	apache-pig 
select count(distinct username), count(distinct t1.username) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select t1.issue_id, count(distinct t2.name) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select issue_id, count(*) from issue_comment group by issue_id	apache-pig 
select t1.issue_id, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select issue_id, count(*) from issue_comment group by issue_id	apache-pig 
select t1.issue_id, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select count(*), t1.issue_id from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.field_type = "Comment" group by t1.issue_id	apache-pig 
select issue_id, count(*) from issue_comment group by issue_id	apache-pig 
select t1.issue_id, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select issue_id, summary, description from issue	apache-pig 
select t1.issue_id, t1.select t1.issue_id, t1.select t1.issue_id, t1.summary, t1.description from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id	apache-pig 
select issue_id, description, count(*), t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select issue_id, sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum(sum)) from issue_comment)	apache-pig 
select t1.issue_id, t1.select t1.issue_id, t1.select t1.issue_id, t1.description, t2.description from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id	apache-pig 
select t1.issue_id, t1.select t1.issue_id, t1.select t1.issue_id, t1.description, t2.description from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id	apache-pig 
select issue_id, summary, description from issue	apache-pig 
select t1.change_set from code_change as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592' intersect select t1.change_set from code_change as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select commit_hash from issue where created_date = "PIG-3592" and resolved_date = "Resolved"	apache-pig 
select commit_hash from issue_comment where created_date = 'PIG-3592' intersect select commit_hash from issue_comment where created_date = 'PIG-3592'	apache-pig 
select commit_hash from issue_comment where created_date > (select created_date from issue where issue_id = 'PIG-3592') and resolved_date < (select resolved_date from issue_fix_version where issue_id = 'Resolved')	apache-pig 
select t1.commit_hash from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.created_date > 'PIG-3592' intersect select t1.commit_hash from code_change as t1 join issue_fix_version as t2 on t1.code_change = t2.code_change where t2.issue_id = 'PIG-3592'	apache-pig 
select t1.change_set from code_change as t1 join issue_comment as t2 on t1.change_set = t2.code_change where t2.created_date >= (select created_date from issue_comment where issue_id = 'PIG-3592') intersect select t1.change_set from code_change as t1 join issue_comment as t2 on t1.change_set = t2.code_change where t2.created_date < (select created_date from issue_comment where issue_id = 'PIG-3592')	apache-pig 
select t1.committed_date, t2.resolved_date from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592' intersect select t1.committed_date, t2.resolved_date from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	apache-pig 
select count(*) from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 join issue as t4 on t2.issue_id = t4.issue_id where t3.type = "Git" and t3.type = "Initialization"	apache-pig 
select count(*), sum(issue_id) from issue as t1 join jira_repository as t2 on t1.jira_repository = t2.jira_repository where t2.key = 'PIG'	apache-pig 
select	apache-pig 
select	apache-pig 
select count(*), type from issue where type = "Bit" union select type from issue where type = "Initialization"	apache-pig 
select type, count(*) from issue where type = "Bit" or type = "Initialization" group by type	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(*) from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select count(*) from issue_fix_version as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = (select t2.issue_id from issue_fix_version as t3 join issue_fix_version as t4 on t3.issue_id = t4.issue_id where t4.type = "PIG-3599")	apache-pig 
select count(*) from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t1.issue_id = "PIG-3599"	apache-pig 
select count(distinct file_path) from issue_link where issue_id = "PIG-3599"	apache-pig 
select count(*) from issue_attachment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select count(distinct t1.file_path) from code_change as t1 join issue_link as t2 on t1.code_change = t2.code_change where t2.issue_id = "PIG-3599"	apache-pig 
select count(distinct t1.file_path) from issue_attachment as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select min(t1.file_path) from code_change as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = 'Bug'	apache-pig 
select * from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = "Ghost"	apache-pig 
select count(*) from issue_link as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change where t3.type = "Git"	apache-pig 
select count(*) from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id where t1.type = "Ghost"	apache-pig 
select count(*) from file_path as t1 join issue_link as t2 on t1.file_path = t2.file_path join issue_fix_version as t3 on t2.issue_id = t3.issue_id where t3.type = 'Bug'	apache-pig 
select min(t1.file_path) from code_change as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = 'Bug'	apache-pig 
select count(*), t1.issue_id from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t1.type = "Georgia" group by t1.issue_id	apache-pig 
select count(*) from issue_link as t1 join issue as t2 on t1.source_issue_id = t2.source_issue_id where t2.type = "Gitter" intersect select count(*) from issue_link as t1 join issue as t2 on t1.target_issue_id = t2.target_issue_id where t2.type = "Initialization"	apache-pig 
select count(*) from issue where type = "Initial" and type = "Gateway"	apache-pig 
select count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t1.type = "Ghost" intersect select count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t1.type = "Initialization"	apache-pig 
select count(*) from issue where type = "Bitcher" intersect select count(*) from issue where type = "Initial"	apache-pig 
select count(*) from issue_link as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = "Gitter" intersect select count(*) from issue_link as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = "Initialization"	apache-pig 
select count(*) from issue_link as t1 join issue as t2 on t1.source_issue_id = t2.source_issue_id where t2.type = "Git" intersect select count(*) from issue_link as t1 join issue as t2 on t1.target_issue_id = t2.target_issue_id where t2.type = "Initialization"	apache-pig 
select count(*) from issue_link as t1 join issue as t2 on t1.source_issue_id = t2.source_issue_id where t2.type = "Git" intersect select count(*) from issue_link as t1 join issue as t2 on t1.target_issue_id = t2.target_issue_id where t2.type = "Initialization"	apache-pig 
select source_issue_id, target_issue_id from issue where type = 'Initialization' intersect select source_issue_id, target_issue_id from issue where type = 'Bitter'	apache-pig 
select t1.issue_id from issue_link as t1 join issue as t2 on t1.issue_id = t2.source_issue_id where t2.type = "Git" intersect select t1.issue_id from issue_link as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.type = "Initialization"	apache-pig 
select issue_id from issue where type = "Git" intersect select issue_id from issue_link where type = "Initialization"	apache-pig 
select issue_id from issue where type = "Git" intersect select issue_id from issue_link where type = "Initialization"	apache-pig 
select source_issue_id, target_issue_id from issue where type = 'Gitter' intersect select source_issue_id, target_issue_id from issue where type = 'Initialization'	apache-pig 
select source_issue_id, target_issue_id from issue where type = "Git" intersect select source_issue_id, target_issue_id from issue where type = "Initialization"	apache-pig 
select issue_id, target_issue_id from issue where type = "Git" intersect select issue_id, target_issue_id from issue where type = "Initialization"	apache-pig 
select distinct name from issue_link	apache-pig 
select distinct type from issue	apache-pig 
select t1.name from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id join issue_link as t3 on t2.issue_id = t3.issue_id where t3.field = 'Pig' group by t1.name having count(*) = 2	apache-pig 
select distinct(t1.name) from issue_link as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join git_repository as t3 on t2.git_repository_id = t3.git_repository_id	apache-pig 
select distinct t1.name from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.field_type = "PIG"	apache-pig 
select distinct t1.name from issue_link as t1 join issue_changelog as t2 on t1.source_issue_id = t2.source_issue_id join issue_link as t3 on t2.issue_id = t3.issue_id where t3.field = "PIG"	apache-pig 
select distinct name from issue_link as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t3.issue_id having count(distinct t1.name) >= 1	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Closers" group by t1.source_issue_id	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Closers" group by t1.type	apache-pig 
select t1.type, count(*) from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.target_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = "Closers"	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Clothes"	apache-pig 
select distinct t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Clothes"	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes" intersect select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes" intersect select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select distinct type from issue	apache-pig 
select distinct type from issue	apache-pig 
select distinct t1.type from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join git_repository as t3 on t2.git_repository_id = t3.git_repository_id where t3.field_type = "PIG"	apache-pig 
select distinct type from issue	apache-pig 
select distinct type from issue	apache-pig 
select distinct type from issue	apache-pig 
select distinct type from issue	apache-pig 
select * from issue where type = 'Bug'	apache-pig 
select * from issue where type = "Git"	apache-pig 
select * from issue where type = "Georgia"	apache-pig 
select * from issue where type = "Bitcoin" and field_type = "PIG"	apache-pig 
select * from issue where type = "Georgia"	apache-pig 
select * from issue where type = "Georgia"	apache-pig 
select * from issue where type = "Git"	apache-pig 
select issue_id from issue except select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.status!= "In Progress"	apache-pig 
select status from issue where status!= "In Progress"	apache-pig 
select status from issue where status!= "In Progress"	apache-pig 
select status from issue where status!= "In Progress"	apache-pig 
select issue_id from issue except select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.status = "In Progress"	apache-pig 
select issue_id from issue except select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.status = "In Progress"	apache-pig 
select status from issue where status not in (select t1.issue_id from issue_changelog as t1 join field as t2 on t1.field_type = t2.field_type where t2.status = "In Progress")	apache-pig 
select max(t1.file_path) from code_change as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.type = 'Improvement'	apache-pig 
select max(t1.filename) from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id where t1.type = "Initialized"	apache-pig 
select count(*) from issue_link as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join code_change as t3 on t2.code_change = t3.code_change where t3.type = "Git"	apache-pig 
select count(*) from issue as t1 join code_change as t2 on t1.issue_id = t2.issue_id where t1.type = "Git"	apache-pig 
select count(*) from file_path as t1 join issue_link as t2 on t1.file_path = t2.file_path join issue as t3 on t2.issue_id = t3.issue_id where t3.type = 'Improvement' group by t2.issue_id	apache-pig 
select max(t1.file_path) from code_change as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id where t2.type = 'Improvement'	apache-pig 
select count(*), t1.issue_id from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id where t1.type = "Initialization" group by t1.issue_id	apache-pig 
