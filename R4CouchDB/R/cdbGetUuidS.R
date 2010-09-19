cdbGetUuidS <- function(cdb){
  ## write test functions!

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if (cdb$error == ""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }

    adrString <- paste(cdb$baseUrl(cdb),
                       "_uuids",
                       queryString,
                       sep="")

    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
                  )

    cdb$res <- fromJSON(res)$uuids

    return( cdb )
  }else{
    stop( cdb$error )
  }
}
