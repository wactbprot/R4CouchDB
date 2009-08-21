getViewRes <- function( couchConConv ){

  if(couchConConv$design == "") {
    couchConConv$error <- "no couchConConv$design given"
  }

  if(couchConConv$view == "") {
    couchConConv$error <- paste(couchConConv$error,
                                "no couchConConv$design given", sep=" ")
  }



    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,
                       "/_design/",
                       couchConConv$design,
                       "/_view/",
                       couchConConv$view,
                       sep="")

    res <- getURLContent(adrString,
                          .opts = list(customrequest = "GET"))

    couchConConv$res <- fromJSON(res)

  return( couchConConv )

}
