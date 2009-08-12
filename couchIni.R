## http://www.omegahat.org/RJSONIO/
## thanx to Duncan Temple Lang
rc <- library(RCurl, logical.return = TRUE)
rj <- library(RJSONIO, logical.return = TRUE)

if(rc && rj){

  couchConConv <- list(
                       serverName = "localhost",
                       port = "5984",
                       noOfUuids="1",
                       databaseName="",
                       newDatabaseName="",
                       id="",
                       rev="",
                       postFile="",
                       putFile="",
                       error=""
                       )


   source("getUuids.R")
   source("listDatabases.R")
   source("makeDatabase.R")
   source("addDoc.R")


}else{
## libs can be loaded online ...
}
