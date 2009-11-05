cdbGetUuids <- function(cdb){
  ## write test functions!

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

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


    res <- getURLContent(adrString,
                         customrequest = "GET",
                         curl=cdb$curl
                        )

    cdb$id <- fromJSON(res)$uuids

    return( cdb )
  }else{
    return( cdb )
  }
}
