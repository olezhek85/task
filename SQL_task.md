###SQL task

**Given tables**<br>
★ tasks (id, name, status, project_id) <br>
★ projects (id, name) <br>

**Write the queries for:**<br>

★ Get all statuses, not repeating, alphabetically ordered
```sql
SELECT DISTINCT status
FROM tasks
ORDER BY status
```
★ Get the count of all tasks in each project, order by tasks count descending
```sql
SELECT projects.id, COUNT(tasks.id) AS task_count
FROM projects LEFT JOIN tasks
  ON projects.id = tasks.project_id
GROUP BY projects.id
ORDER BY task_count DESC
```
★ Get the count of all tasks in each project, order by projects names
```sql
SELECT projects.name, COUNT(tasks.id) AS task_count
FROM projects LEFT JOIN tasks
  ON projects.id = tasks.project_id
GROUP BY projects.id
ORDER BY task_count DESC
```
★ Get the tasks for all projects having the name beginning with "N" letter
```sql
SELECT tasks.name
FROM projects INNER JOIN tasks
  ON projects.id = tasks.project_id
WHERE tasks.name LIKE 'N%'
```
★ Get the list of all projects containing the "a" letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL
```sql
SELECT projects.name, COUNT(tasks.id) AS task_count
FROM projects LEFT JOIN tasks
  ON projects.id = tasks.project_id
WHERE projects.name LIKE '%a%'
GROUP BY projects.id
```
★ Get the list of tasks with duplicate names. Order alphabetically
```sql
SELECT name, COUNT(*)
FROM tasks
GROUP BY name
HAVING COUNT(*) > 1
```
★ Get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count
```sql
SELECT tasks.name
FROM projects LEFT JOIN tasks
  ON projects.id = tasks.project_id
WHERE projects.name = 'Garage' 
GROUP BY tasks.name, tasks.status
HAVING COUNT(tasks.id) > 1
ORDER BY COUNT(tasks.id)
```
★ Get the list of project names having more than 10 tasks in status "completed". Order by project_id
```sql
SELECT projects.name
FROM projects LEFT JOIN tasks
  ON projects.id = tasks.project_id
WHERE tasks.status = 'completed'
GROUP BY projects.id
HAVING COUNT(tasks.id) > 10
```
