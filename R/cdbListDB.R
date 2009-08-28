cdbListDB <- function(cdb){
  ## write test functions!
  if(cdb$error == ""){
    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port, "/_all_dbs",
                       sep="")

    res <- fromJSON(getURLContent(adrString))
    cdb$res <- res
    return( cdb )
  }else{
    print(cdb$error)
    return( cdb )
  }
}
