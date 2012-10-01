cdbRemoveDB <- function(cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if( cdb$error == ""){
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$removeDBName,
                       sep="")
    
    res       <- getURL(adrString,
                        curl=cdb$curl,
                        customrequest = "DELETE",
                        .opts =cdb$opts(cdb))
    return(cdb$checkRes(cdb,res))

  }else{
    stop(cdb$error)
  }
}
