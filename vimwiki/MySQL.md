# MySQL

## Viewing a Server's Logs

When in a client tool, do the following.

`SET GLOBAL log_output = 'TABLE';`
`SET GLOBAL general_log = 'ON';`
Do the work you wish to inspect.
`SELECT * FROM mysql.general_log;`

## Cloning Data using mysqldump

First, pull the data down in to a local file.

`mysqldump -u [username] -p -h [host] --single-transaction [database] [table] > [file]`

E.G.

`mysqldump -u verification_readonly -p -h verification.db.thebeansgroup.com --single-transaction verification verifications > ~/Downloads/verifications.sql`

Then, make those files available to the MySQL instance in question. Typically
this means putting them into the root directory of a Project, so it's Docker
container can see them.

Then import them into the MySQL instance using the MySQL client, again typically
from within the Docker container.

`mysql -u [user] -h [host] [database] < [filepath]`

E.G.

`mysql -u root -h mysql verification_development < /app/src/verifications.sql`
