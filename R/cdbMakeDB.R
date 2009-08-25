cdbMakeDB <- function(cdb){

  ## write test functions!
  if( cdb$error == ""){

    if(cdb$newDatabaseName == ""){

      cdb$error <- "no cdb$newDatabaseName given"

      return( cdb)

    }else{

      adrString <- paste("http://",
                         cdb$serverName,":",
                         cdb$port,"/",
                         cdb$newDatabaseName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))
      cdb$res <- fromJSON( res )

      ## newDatabase is generated it's now no longer a new one
      cdb$databaseName <- cdb$newDatabaseName
      return( cdb )
    }
  }
  else{return( cdb )}
}
