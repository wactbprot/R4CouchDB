cdbRemoveDB <- function(cdb){
  if( cdb$error == ""){

    if(cdb$databaseName == ""){

      cdb$error <- "no  cdb$databaseName to remove"
      return(cdb)
    }else{

      adrString <- paste("http://",
                         cdb$serverName,":",
                         cdb$port,"/",
                         cdb$databaseName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "DELETE"))
      return( fromJSON(res))

    }
  }else{
    return(cdb)
  }
}
