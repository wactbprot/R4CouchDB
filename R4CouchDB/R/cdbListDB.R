cdbListDB <- function(cdb){
  ## write test functions!
  if(cdb$error == ""){
    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port, "/_all_dbs",
                       sep="")

    res <- getURLContent(adrString)
    cdb$res <- fromJSON(res)
    return( cdb )
  }else{
    print(cdb$error)
    return( cdb )
  }
}
