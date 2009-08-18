makeDatabase <- function(couchConConv){

  ## write test functions!
  if( couchConConv$error == ""){

    if(couchConConv$newDatabaseName == ""){

      couchConConv$error <- "no couchConConv$newDatabaseName given"

      return( couchConConv)

    }else{

      adrString <- paste("http://",
                         couchConConv$serverName,":",
                         couchConConv$port,"/",
                         couchConConv$newDatabaseName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))
      couchConConv$res <- fromJSON( res )

      ## newDatabase is generated it's now no longer a new one
      couchConConv$newDatabaseName <- ""
      return( couchConConv )
    }
  }
  else{return( couchConConv )}
}
