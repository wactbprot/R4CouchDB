cdbRemoveDB <- function(cdb){
  if( cdb$error == ""){

    if(cdb$DBName == ""){

      cdb$error <- "no  cdb$DBName to remove"
      return(cdb)
    }else{

      adrString <- paste("http://",
                         cdb$serverName,":",
                         cdb$port,"/",
                         cdb$DBName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "DELETE"))
      cdb$res <- fromJSON(res)
      cdb$DBName <- ""
      return( cdb )

    }
  }else{
    return(cdb)
  }
}
