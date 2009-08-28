cdbMakeDB <- function(cdb){

  ## write test functions!
  if( cdb$error == ""){

    if(cdb$newDBName == ""){

      cdb$error <- "no cdb$newDBName given"

      return( cdb)

    }else{

      adrString <- paste("http://",
                         cdb$serverName,":",
                         cdb$port,"/",
                         cdb$newDBName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))
      cdb$res <- fromJSON( res )

      ## newDB is generated it's now no longer a new one
      cdb$DBName <- cdb$newDBName
      return( cdb )
    }
  }
  else{
    print( cdb$error )
    return( cdb )
  }
}
