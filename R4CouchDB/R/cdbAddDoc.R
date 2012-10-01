cdbAddDoc <- function( cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  if(cdb$error == ""){
    if(cdb$id == ""){
      cdb <- cdbGetUuid(cdb)
    }
    
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl,
                  postfields = cdb$toJSON(cdb$dataList),
                  httpheader=c('Content-Type: application/json'),
                  .opts =cdb$opts(cdb))
    
    res <- cdb$fromJSON( res )
    
    if(length(res$ok) > 0){
      cdb$dataList$'_id' <- res$id
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
