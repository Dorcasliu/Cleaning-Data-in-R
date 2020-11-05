#Debian or Ubuntu: sudo apt install -y libmariadb-client-lgpl-dev
#install.packages("RMariaDB")

library(DBI)
#Connect to a database group specified in the .my.cnf file
conn <- dbConnect(RMariaDB::MariaDB(), 
                  groups="mydb-group")

dbListTables(conn)

insert_result <- dbSendQuery(conn, "INSERT INTO person VALUES(NULL, 'Alex', 2005)")
dbHasCompleted(insert_result)

result <- dbSendQuery(conn, "SELECT * FROM person")
result
dbFetch(result, n=-1) #fetch all rows

dbHasCompleted(result)
dbClearResult(result)

dbDisconnect(conn)
