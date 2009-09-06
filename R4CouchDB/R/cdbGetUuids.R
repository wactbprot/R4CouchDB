cdbGetUuids <- function(cdb){
  ## write test functions!

  if (cdb$error ==""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port, "/_uuids",
                       queryString,
                       sep="")

    res <- getURLContent(adrString)
    cdb$id <- fromJSON(res)$uuids

    return( cdb )
  }else{
    print(cdb$error)
    return( cdb )
  }
}
