cdbAddAttachment <- function( cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
    
  if(cdb$error == ""){
    tmpN      <- length(tmpFn <- unlist(strsplit(cdb$fileName,"\\.")))
    noOfBytes <- file.info(cdb$fileName)$size
    
    con       <- file(cdb$fileName, "rb")
    data      <- readBin(con,n=noOfBytes,raw())
    close(con)
    
    cdb$rev   <- cdbGetDoc(cdb)$res$'_rev'
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,"/",
                       basename(cdb$fileName),"?rev=",
                       cdb$rev,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  postfields = data,
                  httpheader=c('Content-Type' =  paste("image/",tmpFn[tmpN],sep="")),
                  curl=cdb$curl,
                  .opts =cdb$opts(cdb)
                  )
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop(cdb$error)
  }
}
