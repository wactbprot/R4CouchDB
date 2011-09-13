cdbGetView <- function( cdb ){
  
  if(cdb$design == "") {
    cdb$error <- paste(cdb$error, "no cdb$design given"
                       , sep=" ")
  }

  if(cdb$view == "") {
    cdb$error <- paste(cdb$error,
                       "no cdb$design given", sep=" ")
  }
  
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
    
    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
                  )
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop( cdb$error )
  }
}
