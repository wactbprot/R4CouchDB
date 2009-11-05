cdbGetView <- function( cdb ){

  if(cdb$design == "") {
    cdb$error <- paste(cdb$error, "no cdb$design given"
                       , sep=" ")
  }

  if(cdb$view == "") {
    cdb$error <- paste(cdb$error,
                       "no cdb$design given", sep=" ")
  }

  if(cdb$error ==""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,
                       "/_design/",
                       cdb$design,
                       "/_view/",
                       cdb$view,
                       queryString,
                       sep="")

    res <- getURLContent(adrString,
                         curl=cdb$curl
                         )

    cdb$res <- fromJSON( res )

    return( cdb )

  }else{
    print(cdb$error)
    return( cdb )
  }
}
