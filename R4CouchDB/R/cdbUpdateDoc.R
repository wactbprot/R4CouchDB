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
    ## go for the latest revition
    cdb$rev <- cdbGetDoc(cdb)$res$'_rev'
    cdb$dataList$'_id' <- cdb$id 
    cdb$dataList$'_rev' <- cdb$rev

    data <- toJSON(cdb$dataList)

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURL(customrequest = "PUT",
                  curl=cdb$curl,
                  url = adrString,
                  postfields = data,
                  httpheader=c('Content-Type: application/json'))

    cdb$res <- fromJSON( res )
    ## update revision
    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    return( cdb )

  }else{

    stop( cdb$error )
  }
}
