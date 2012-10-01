cdbGetUuid <- function(cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  if (cdb$error ==""){

    adrString <- paste(cdb$baseUrl(cdb),
                       "_uuids?count=1",
                       sep="")
    res           <- getURL(adrString,
                            customrequest = "GET",
                            curl=cdb$curl)

    cdb <-  cdb$checkRes(cdb,res)

    cdb$id <- unlist(cdb$res$uuids)

    return(cdb)

  }else{
    stop(cdb$error)
  }   
}
