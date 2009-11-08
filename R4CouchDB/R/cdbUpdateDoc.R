cdbUpdateDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- paste(cdb$error,
                       " no cdb$id given ",
                       sep=" ")
  }

  if( cdb$serverName == ""){
    cdb$error <- paste(cdb$error,
                       " no cdb$serverName given ",
                       sep=" ")
  }

  if(length(cdb$dataList) < 1){
    cdb$error <- paste(cdb$error,
                       " no cdb$dataList given",
                       sep=" ")
  }

  if( cdb$error ==""){

    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    data <- toJSON(list('_id'=cdb$id,
                        '_rev'=cdb$rev,
                        cdb$dataList)
                   )

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURL(customrequest = "PUT",
                  curl=cdb$curl,
                  url = adrString,
                       postfields = data
                  )

    cdb$res <- fromJSON( res )
    ## update revision
    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    return( cdb )

  }else{

    stop( cdb$error )
  }
}
