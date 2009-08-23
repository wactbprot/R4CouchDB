addDoc <- function( couchConConv){

  ## always fresh id!
    couchConConv$noOfUuids <- "1"
    couchConConv <- getUuids(couchConConv)


  if(couchConConv$databaseName ==""){
    couchConConv$error <- "no couchConConv$databaseName given"
    return( couchConConv )
  }

  if( (length(couchConConv$dataList) < 1)){
    couchConConv$error <- "no couchConConv$dataList given"
    return( couchConConv )
  }else{

    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,"/",
                       couchConConv$id,
                       sep="")

    data <- toJSON(couchConConv$dataList)


    header <- list('Content-Type' = 'application/json')
    reader <- basicTextGatherer()


    res <- getURLContent(customrequest = "PUT",
                         url = adrString,
                         postfields = data,
                         headerfunction = reader$update)


    couchConConv$res <- fromJSON( res )
    return( couchConConv )

  }
}
