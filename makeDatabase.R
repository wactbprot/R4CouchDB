makeDatabase <- function(couchConConv){
                                        # write test functions!

  if(couchConConv$newDatabaseName == ""){
    return( list(error="no couchConConv$newDatabaseName given"))
  }else{
    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$newDatabaseName,
                       sep="")
    res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))

    return( fromJSON(res))
  }
}
