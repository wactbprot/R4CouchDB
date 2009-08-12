makeDatabases <- function(couchConConv){
# write test functions!

  adrString <- paste("http://",
                     couchConConv$serverName,":",
                     couchConConv$port,"/",
                     couchConConv$newDatabaseName,
                     sep="")
  res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))
  
  return( fromJSON(res))
}
