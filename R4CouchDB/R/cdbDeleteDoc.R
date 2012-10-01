cdbDeleteDoc <- function( cdb ){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  if(cdb$error == ""){
    cdb     <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'
    
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       "?rev=",
                       cdb$rev,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "DELETE",
                  curl = cdb$curl,
                  .opts =cdb$opts(cdb))
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop(cdb$error)
  }
}
