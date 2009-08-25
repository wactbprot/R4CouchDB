cdbGetView <- function( cdb ){

  if(cdb$design == "") {
    cdb$error <- "no cdb$design given"
  }

  if(cdb$view == "") {
    cdb$error <- paste(cdb$error,
                                "no cdb$design given", sep=" ")
  }
  if(cdb$queryParam == ""){
    queryString <- ""
  }else{
    queryString <- paste("/?",cdb$queryParam, sep="")
  }


    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$databaseName,
                       "/_design/",
                       cdb$design,
                       "/_view/",
                       cdb$view,
                       queryString,
                       sep="")

    res <- getURLContent(adrString,
                          .opts = list(customrequest = "GET"))

    cdb$res <- fromJSON(res)

  return( cdb )

}
