rc <- library(RCurl, logical.return = TRUE)
rj <- library(rjson, logical.return = TRUE)

if(rc && rj){

  print("\nlibs loaded\n")

        couchConConv <- list(
                     serverName = "localhost",
                     port = "5984",
                     noOfUuids="1",
                     )

  source("getUuids.R")

}else{
## libs can be loaded online ...
}
