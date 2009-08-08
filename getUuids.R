getUuids <- function(couchConConv){
# write test functions!
  adrString <- paste("http://",
                     couchConConv$serverName,":",
                     couchConConv$port, "/_uuids?count=",
                     couchConConv$noOfUuids,
                     sep="")
 res <- getURL(adrString)
  return( fromJSON(res))
}
