#' @title CA4.R
#' @description Creating the CA4 database, querying and modifying it
#' @author Jim Kealy
#' @bugs None
#' @keywords SQL, DBI, query, execute, tabular, local
#' @see https://cran.r-project.org/web/packages/RSQLite/vignettes/RSQLite.html
#' @seealso https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html


## Clear console on each execute and set chunk default to not show code

cat('\014')

## Download and load libraries

if(!require("DBI"))
  install.packages("DBI")
if(!require("dplyr"))
  install.packages("dplyr")
# if(!require("readr"))
#   install.packages("readr")

library(DBI)
#library(readr)
library(dplyr)

# Connect (and create) a new local SQLite DB

conn <- dbConnect(RSQLite::SQLite(), "daie_ca4_data.sqlite")

# Add table data to the SQLite DB


#dbExecute(conn, "CREATE TABLE Asset (
#    id integer NOT NULL CONSTRAINT Asset_pk PRIMARY KEY AUTOINCREMENT,
#    type varchar(50) NOT NULL,
#    format varchar(50) NOT NULL,
#    WorkItem_id integer NOT NULL
#)")

#dbExecute(conn, "CREATE TABLE Library (
#    id integer NOT NULL CONSTRAINT Library_pk PRIMARY KEY AUTOINCREMENT,
#    name varchar(128) NOT NULL,
#    Asset_id integer NOT NULL,
#    Project_id integer NOT NULL
#)")

#dbExecute(conn, "CREATE TABLE Project (
#  id integer NOT NULL CONSTRAINT Project_pk PRIMARY KEY AUTOINCREMENT,
#  name varchar(128) NOT NULL,
#  startDate date NOT NULL,
#  endDate date NOT NULL
#)")


#getting error Error: table ProjectMembers already exists. need to watch more tutorials

#dbExecute(conn, "CREATE TABLE ProjectMembers (
#    TeamMembers_id integer NOT NULL,
#    Project_id integer NOT NULL,
#    CONSTRAINT ProjectMembers_pk PRIMARY KEY (TeamMembers_id,Project_id)
#)")

#dbExecute(conn, "CREATE TABLE TeamMembers (
#    id integer NOT NULL CONSTRAINT TeamMembers_pk PRIMARY KEY AUTOINCREMENT,
#    firstname varchar(32) NOT NULL,
#    lastname varchar(128) NOT NULL,
#    email varchar(128) NOT NULL
#)")

#dbExecute(conn, "CREATE TABLE WorkItem (
#    id integer NOT NULL CONSTRAINT WorkItem_pk PRIMARY KEY AUTOINCREMENT,
#    name varchar(128) NOT NULL,
#    status varchar(50) NOT NULL,
#    TeamMembers_id integer NOT NULL
#)")


#dbWriteTable(conn, "ca4", mtcars, overwrite = T, append = F)

# Test the DB

# view data within RStudio
# View(mtcars)

dbListTables(conn)
dbListFields(conn, "TeamMembers")

# Query and store the results

# CRUD - Create, Rename, Update, Delete

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars")
# result

# result <-  dbGetQuery(conn, "SELECT wt, disp, mpg FROM mtcars")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22 ORDER BY hp ASC LIMIT 4")
# result

# result <-  dbGetQuery(conn, "SELECT * FROM mtcars WHERE mpg >= 18 AND mpg <= 22 ORDER BY hp ASC LIMIT 4")
# result

# result <-  dbGetQuery(conn, "SELECT COUNT(mpg) FROM mtcars WHERE mpg > 25")
# result
# 
# result <-  dbGetQuery(conn, "SELECT AVG(hp) FROM mtcars")
# result

# Execute a query with no result

result <-  dbGetQuery(conn, "SELECT * FROM ca4")
result 

dbExecute(conn, "DELETE FROM ca4 WHERE mpg <= 20")

result <-  dbGetQuery(conn, "SELECT * FROM ca4")
result

# Do NOT forget to disconnect - otherwise we may hit a remote connection limit

dbDisconnect(conn)


