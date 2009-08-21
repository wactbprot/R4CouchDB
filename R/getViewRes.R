getViewRes <- function( couchConConv ){

  if(couchConConv$design == "") {
    couchConConv$error <- "no couchConConv$design given"
  }

  if(couchConConv$view == "") {
    couchConConv$error <- paste(couchConConv$error,
                                "no couchConConv$design given", sep=" ")
  }
  if(couchConConv$queryParam == ""){
    queryString <- ""
  }else{
    queryString <- paste("/?",couchConConv$queryParam, sep="")
  }


    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,
                       "/_design/",
                       couchConConv$design,
                       "/_view/",
                       couchConConv$view,
                       queryString,
                       sep="")

    res <- getURLContent(adrString,
                          .opts = list(customrequest = "GET"))

    couchConConv$res <- fromJSON(res)

  return( couchConConv )

}
