postFile <- function( couchConConv ){


## I think its better to give for add and post always a fresh id ...

    couchConConv$noOfUuids <- "1"
    couchConConv <- getUuids(couchConConv)


  if(couchConConv$databaseName ==""){
    couchConConv$error <- "no couchConConv$databaseName given"
    return( couchConConv )
  }

  if( (length(couchConConv$postFile ) < 1)){

    couchConConv$error <- "no couchConConv$postFile given"

    return( couchConConv )
  }else{

    data <- paste(readLines( couchConConv$postFile ),
                  collapse = "\n")

    if(try(length(names(fromJSON(data)))) < 1){

    couchConConv$error <- "couchConConv$postFile contains no valid json"

    return( couchConConv )

    }

  }

  adrString <- paste("http://",
                     couchConConv$serverName,":",
                     couchConConv$port,"/",
                     couchConConv$databaseName,"/",
                     couchConConv$id,
                     sep="")


  header <- list('Content-Type' = 'application/json')
  reader <- basicTextGatherer()

  res <- getURLContent(customrequest = "PUT",
                       url = adrString,
                       postfields = data,
                       headerfunction = reader$update)


  couchConConv$res <- fromJSON( res )

  return( couchConConv )

}
