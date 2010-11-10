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
                  customrequest = "GET"
                  )

    res <- fromJSON(res)
   
    if(!(length(res$error) > 0)){
      cdb$res <- res
      return( cdb )
    }else{
      cdb$error <- paste(cdb$error, res$error,res$reason)
    }
  }
  if(!(cdb$error == "")){
    stop( cdb$error )
  }
}
