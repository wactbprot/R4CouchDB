makeDatabase <- function(couchConConv){

  ## write test functions!
  if( couchConConv$error == ""){

    if(couchConConv$newDatabaseName == ""){

      couchConConv$error <- "no couchConConv$newDatabaseName given"

      return( couchConConv$error)

    }else{

      adrString <- paste("http://",
                         couchConConv$serverName,":",
                         couchConConv$port,"/",
                         couchConConv$newDatabaseName,
                         sep="")
      res <- getURLContent(adrString, .opts = list(customrequest = "PUT"))

      return( fromJSON(res))
    }
  }
  else{return( couchConConv$error )}
}
