cdbGetList <- function( cdb ){

  if(cdb$design == "") {
    cdb$error <- paste(cdb$error, "no cdb$design given"
                       , sep=" ")
  }

  if(cdb$view == "") {
    cdb$error <- paste(cdb$error,
                       "no cdb$view given", sep=" ")
  }

  if(cdb$list == "") {
    cdb$error <- paste(cdb$error,
                       "no cdb$list given", sep=" ")
  }

  if(cdb$error ==""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,
                       "/_design/",
                       cdb$design,
                       "/_list/",
                       cdb$list,
                       "/",cdb$view,
                       queryString,
                       sep="")

    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
                  )

    res <- fromJSON(res)

    if(!(length(res$error) > 0)){
      cdb$res <- res
      return( cdb )
    }else{
      cdb$error <- paste(cdb$error, res$error,res$reason)
    }
  }
  if(!(cdb$error == "")){
    stop( cdb$error )
  }
}












