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
  
  if(length(cdb$dataList$'_rev') < 1){
    cdb$error <- paste(cdb$error,
                       "no revision in cdb$dataList",
                       sep=" ")
  }

  if( cdb$error ==""){

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURL(customrequest = "PUT",
                  curl=cdb$curl,
                  url = adrString,
                  postfields = toJSON(cdb$dataList),
                  httpheader=c('Content-Type: application/json'))

    res <- fromJSON( res )
    
    if((length(res$ok)) > 0 & res$ok){
      ## update revision in dataList
      ## it's not quite ok
      ## looks like a side effect o_°?
      cdb$dataList$'_rev' <- res$rev
      cdb$res <- res
      return( cdb )
    }else{
      cdb$error <- paste(cdb$error, res$error)
    }
  }
  if(!(cdb$error == "")){
    stop( cdb$error )
  }
}
