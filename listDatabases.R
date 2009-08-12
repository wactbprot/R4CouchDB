listDatabases <- function(couchConConv){
  ## write test functions!
  if(couchConConv$error == ""){
    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port, "/_all_dbs",
                       sep="")
    res <- getURLContent(adrString)
    return( fromJSON(res))
  }else{
    return(couchConConv$error)
  }
}
