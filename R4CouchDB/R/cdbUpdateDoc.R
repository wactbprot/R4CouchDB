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
    ## its terrible I know :(
    pf <- toJSON(cdb$dataList)
    pf <- iconv(pf,"latin1","UTF-8")

    res <- getURL(customrequest = "PUT",
                  curl=cdb$curl,
                  url = adrString,
                  postfields = pf,
                  httpheader=c('Content-Type: application/json'))

    cdb <-  cdb$checkRes(cdb,res)
    
    if((length(cdb$res$ok)) > 0 ){
      # 
      cdb$dataList$'_rev' <- cdb$res$rev #!?
      cdb$rev <- cdb$res$rev
    }
    return(cdb)
  }else{
    stop(cdb$error)
  }   
}
