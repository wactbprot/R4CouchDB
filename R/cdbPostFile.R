cdbPostFile <- function( cdb ){


## I think its better to give for add and post always a fresh id ...

    cdb$noOfUuids <- "1"
    cdb <- cdbGetUuids(cdb)


  if(cdb$databaseName ==""){
    cdb$error <- "no cdb$databaseName given"
    return( cdb )
  }

  if( (length(cdb$postFile ) < 1)){

    cdb$error <- "no cdb$postFile given"

    return( cdb )
  }else{

    data <- paste(readLines( cdb$postFile ),
                  collapse = "\n")

    if(try(length(names(fromJSON(data)))) < 1){

    cdb$error <- "cdb$postFile contains no valid json"

    return( cdb )

    }

  }

  adrString <- paste("http://",
                     cdb$serverName,":",
                     cdb$port,"/",
                     cdb$databaseName,"/",
                     cdb$id,
                     sep="")


  header <- list('Content-Type' = 'application/json')
  reader <- basicTextGatherer()

  res <- getURLContent(customrequest = "PUT",
                       url = adrString,
                       postfields = data,
                       headerfunction = reader$update)


  cdb$res <- fromJSON( res )

  return( cdb )

}
