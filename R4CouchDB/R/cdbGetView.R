cdbGetView <- function( cdb ){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if(cdb$error ==""){
    
    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }
    
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,
                       "/_design/",
                       cdb$design,
                       "/_view/",
                       cdb$view,
                       queryString,
                       sep="")
    
    res <- getURL(utils::URLencode(adrString),
                  customrequest = "GET",
                  curl=cdb$curl
                  )
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop( cdb$error )
  }
}
