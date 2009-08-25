cdbUpdateDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"

  }

  if( cdb$rev == ""){

    ## first I need getDoc.R
    ## ...
    ## done
    ## I should put the file functionality in separate
    ## functions; here the reader for conservation:
    ## ::::::::::::::::::::::::::::::
    ## data <- paste(readLines(cdb$postFile), collapse = "\n")
    ## ::::::::::::::::::::::::::::::
    ## dataList isn not the right name ...

    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'
  }

  if(length(cdb$dataList) < 1){

    cdb$error <- " no cdb$dataList given"

  }else{

    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    data <- toJSON(list('_id'=cdb$id,
                        '_rev'=cdb$rev,
                        cdb$dataList))
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
  ## update revision
  cdb <- cdbGetDoc(cdb)
  cdb$rev <- cdb$res$'_rev'

  return( cdb )

}
