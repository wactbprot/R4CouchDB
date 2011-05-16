cdbGetConfig <- function(cdb){
  ## write test functions!
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }
  if (cdb$error ==""){
    adrString <- paste(cdb$baseUrl(cdb),
                       "_config",
                       sep="")
    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
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
