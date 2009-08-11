## http://www.omegahat.org/RJSONIO/
## thanx to Duncan Temple Lang
rc <- library(RCurl, logical.return = TRUE)
rj <- library(RJSONIO, logical.return = TRUE)

if(rc && rj){

   couchConConv <- list(
                       serverName = "localhost",
                       port = "5984",
                       noOfUuids="1",
                       newDatabaseName=""
                       )

<<<<<<< HEAD:couchIni.R
   source("getUuids.R")
   source("listDatabases.R")
   source("makeDatabase.R")
=======
        couchConConv <- list(
                     serverName = "localhost",
                     port = "5984",
                     noOfUuids="1"
                     )

  source("getUuids.R")
>>>>>>> f1469b534a5d0def07d706a2890e8773802c0215:couchIni.R

}else{
## libs can be loaded online ...
}
