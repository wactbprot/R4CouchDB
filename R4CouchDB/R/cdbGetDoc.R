cdbGetDoc <- function(cdb){
  
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }
  
  if( cdb$id == ""){
    cdb$error <- paste( cdb$error, " no cdb$id given ")
  }
  
  if(cdb$error == ""){
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "GET")

    return(cdb$checkRes(cdb,res))

  }else{
    stop(cdb$error)
  }
}
