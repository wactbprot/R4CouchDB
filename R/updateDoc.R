updateDoc <- function( couchConConv){

  if( couchConConv$id == ""){
    couchConConv$error <- "no couchConConv$id given"

  }

  if( couchConConv$rev == ""){

    ## first I need getDoc.R
    ## ...
    ## done
    ## I should put the file functionality inte seperate
    ## functions; here the reader for conservation:
    ## ::::::::::::::::::::::::::::::
    ## data <- paste(readLines(couchConConv$postFile), collapse = "\n")
    ## ::::::::::::::::::::::::::::::
    ## dataList isn not the right name ...

    couchConConv <- getDoc(couchConConv)
    couchConConv$rev <- couchConConv$res$'_rev'
  }

  if(length(couchConConv$dataList) < 1){

    couchConConv$error <- " no couchConConv$dataList given"

  }else{

    data <- toJSON(list('_id'=cc$id,
                        '_rev'=cc$rev,
                        couchConConv$dataList))
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
  ## update revision
  couchConConv <- getDoc(couchConConv)
  couchConConv$rev <- couchConConv$res$'_rev'

  return( couchConConv )

}
