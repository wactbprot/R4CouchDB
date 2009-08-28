cdbAddDoc <- function( cdb){

  ## always fresh id!
  ## (because this function is called addDoc)

  if(cdb$DBName ==""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ", sep=" ")
  }

  if( (length(cdb$dataList) < 1)){
    cdb$error <- paste(cdb$error, " no cdb$dataList given ", sep=" ")
  }

    cdb$queryParam <- "count=1"
    cdb <- cdbGetUuids(cdb)


  if( cdb$error =="" ){

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
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

  }else{
    print( cdb$error )
    return( cdb )
  }
}
