cdbAddDoc <- function( cdb){


  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$DBName ==""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ", sep=" ")
  }

  if( (length(cdb$dataList) < 1)){
    cdb$error <- paste(cdb$error, " no cdb$dataList given ", sep=" ")
  }

  if(cdb$id == ""){

    cdb$queryParam <- "count=1"
    cdb <- cdbGetUuids(cdb)

  }else{



    if(is.null(cdbGetDoc( cdb )$res$'_id')){

      cdb$error <- paste(cdb$error, " doc with cdb$id ",
                         cdb$id,
                         " in revision ",
                         alreadyExists$'_rev',
                         " already exists ",
                         sep=" ")
      return(cdb)
    }
  }

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

    reader$reset()

    return( cdb )

  }else{
    print( cdb$error )
    return( cdb )
  }
}
