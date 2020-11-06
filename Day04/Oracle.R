# Oracle Connection
# Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_191")
install.packages("rJava")   
library(rJava)
install.packages("RJDBC")
library(RJDBC)
jdbcDriver <- JDBC(driverClass = "oracle.jdbc.OracleDriver", classPath = "ojdbc6.jar")
con <- dbConnect(jdbcDriver, 
                 "jdbc:oracle:thin:@localhost:1521:xe",
                 "hr","123456")  
dbListTables(con)
query <- "select * from employees" 
result <- dbGetQuery(con, query)
dim(result)
length(result)
class(result)
head(result[,1:3])
# query <- "select * from datavo" 
# result <- dbGetQuery(con, query)
# dim(result)
# length(result)
# class(result)
# head(result[,1:4])
