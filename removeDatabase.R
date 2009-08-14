removeDatabase <- function(couchConConv){
  if( couchConConv$error == ""){

    if(couchConConv$databaseName == ""){

      couchConConv$error <- "no  couchConConv$databaseName to remove"
      return(couchConConv)
    }else{

      adrString <- paste("http://",
                         couchConConv$serverName,":",
                         couchConConv$port,"/",
                         couchConConv$databaseName,
                         sep="")

      res <- getURLContent(adrString, .opts = list(customrequest = "DELETE"))
      return( fromJSON(res))

    }
  }else{
    return(couchConConv)
  }
}
