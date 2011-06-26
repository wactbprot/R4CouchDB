cdbGetUuid <- function(cdb){
  ## write test functions!
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

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
