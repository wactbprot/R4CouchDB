cdbAddDoc <- function( cdb){

  ## always fresh id!
    cdb$noOfUuids <- "1"
    cdb <- cdbGetUuids(cdb)


  if(cdb$databaseName ==""){
    cdb$error <- "no cdb$databaseName given"
    return( cdb )
  }

  if( (length(cdb$dataList) < 1)){
    cdb$error <- "no cdb$dataList given"
    return( cdb )
  }else{

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$databaseName,"/",
                       cdb$id,
                       sep="")

    data <- toJSON(cdb$dataList)


    header <- list('Content-Type' = 'application/json')
    reader <- basicTextGatherer()


    res <- getURLContent(customrequest = "PUT",
                         url = adrString,
                         postfields = data,
                         headerfunction = reader$update)


    cdb$res <- fromJSON( res )
    return( cdb )

  }
}
