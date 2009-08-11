listDatabases <- function(couchConConv){
# write test functions!

  adrString <- paste("http://",
                     couchConConv$serverName,":",
                     couchConConv$port, "/_all_dbs"
                     sep="")
  res <- getURLContent(adrString)
  return( fromJSON(res))
}
