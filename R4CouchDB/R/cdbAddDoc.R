cdbAddDoc <- function( cdb){
  
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }
  
  if(cdb$DBName == ""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ", sep=" ")
  }
  
  if( (length(cdb$dataList) < 1)){
    cdb$error <- paste(cdb$error, " no cdb$dataList given ", sep=" ")
  }
  
  if(cdb$id == ""){
    cdb <- cdbGetUuid(cdb)
  }
  
  if(cdb$error == ""){
    
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")
    
    data <- toJSON(cdb$dataList)
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl,
                  postfields = data,
                  httpheader=c('Content-Type' ='application/json'))
    
    res <- fromJSON( res )

    if(length(res$ok) > 0){
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
