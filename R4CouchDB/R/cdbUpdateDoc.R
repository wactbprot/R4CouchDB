cdbUpdateDoc <- function( cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if( cdb$error ==""){

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURL(customrequest = "PUT",
                  curl=cdb$curl,
                  url = adrString,
                  postfields = cdb$toJSON(cdb$dataList),
                  httpheader=c('Content-Type: application/json'),
                  .opts =cdb$opts(cdb))

    cdb <-  cdb$checkRes(cdb,res)
    
    if((length(cdb$res$ok)) > 0 ){
      cdb$dataList$'_rev' <- cdb$res$rev 
      cdb$rev <- cdb$res$rev
    }
    return(cdb)
  }else{
    stop(cdb$error)
  }   
}
