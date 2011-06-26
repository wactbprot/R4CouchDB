cdbGetUuidS <- function(cdb){
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }
  if (cdb$error == ""){
    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }
    adrString <- paste(cdb$baseUrl(cdb),
                       "_uuids",
                       queryString,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
                  )
    
    return(cdb$checkRes(cdb,res))
    
  }else{
   stop(cdb$error)
 }
}
