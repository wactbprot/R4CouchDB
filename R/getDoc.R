getDoc <- function( couchConConv){

  if( couchConConv$id == ""){
    couchConConv$error <- "no couchConConv$id given"
    return( couchConConv)
  }else{

    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,"/",
                       couchConConv$id,
                       sep="")

    res <- getURLContent(adrString,
                         .opts = list(customrequest = "GET"))

    couchConConv$res <- fromJSON(res)

    return( couchConConv )

  }
}
