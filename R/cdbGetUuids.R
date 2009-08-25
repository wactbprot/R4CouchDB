cdbGetUuids <- function(cdb){
# write test functions!

  adrString <- paste("http://",
                     cdb$serverName,":",
                     cdb$port, "/_uuids?count=",
                     cdb$noOfUuids,
                     sep="")
  res <- getURLContent(adrString)
  cdb$id <- fromJSON(res)$uuids

  return( cdb )
}
