getDoc <- function( couchConConv){
print(couchConConv$id)
  if( couchConConv$id == ""){
    couchConConv$error <- "no couchConConv$id given"
    return( couchConConv)
  }else{
    reader <- basicTextGatherer()

    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,"/",
                       couchConConv$id,
                       sep="")

    res <- getURLContent(adrString, .opts = list(customrequest = "GET"))
      couchConConv$res <- fromJSON(res)




    return( couchConConv)
  }
}
