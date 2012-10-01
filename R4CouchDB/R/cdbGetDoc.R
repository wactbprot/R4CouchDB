cdbGetDoc <- function(cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
    
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
