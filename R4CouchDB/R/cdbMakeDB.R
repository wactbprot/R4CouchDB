cdbMakeDB <- function(cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if(cdb$error == ""){
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$newDBName,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl,
                  .opts =cdb$opts(cdb))
    
    cdb$DBName    <- cdb$newDBName
    cdb$newDBName <- ""

    return(cdb$checkRes(cdb,res))
    
  }else{
    stop(cdb$error)
  }
}

