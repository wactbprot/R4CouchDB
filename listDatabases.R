listDatabases <- function(couchConConv){
  ## write test functions!
  if(couchConConv$error == ""){
    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port, "/_all_dbs",
                       sep="")

    res <- fromJSON(getURLContent(adrString))
    couchConConv$res <- res
    return( couchConConv )
  }else{
    return( couchConConv )
  }
}
