cdbListDB <- function(cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  
  if(cdb$error == ""){
    adrString <- paste(cdb$baseUrl(cdb), "_all_dbs",
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
