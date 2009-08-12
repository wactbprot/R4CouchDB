addDoc <- function( couchConConv){

  if(couchConConv$id == ""){
    couchConConv$noOfUuids <- "1"
    couchConConv$id <- getUuids(couchConConv)$uuids
  }

  if(couchConConv$databaseName ==""){
    couchConConv$error <- "no couchConConv$databaseName given"
   return( couchConConv )
  }

  if(couchConConv$postFile ==""){
    couchConConv$error <- "no couchConConv$postFile given"
    return( couchConConv$error )
  }else{

  adrString <- paste("http://",
                     couchConConv$serverName,":",
                     couchConConv$port,"/",
                     couchConConv$databaseName,"/",
                     couchConConv$id,
                     sep="")

  fileData <- paste(readLines(couchConConv$postFile), collapse = "\n")

  header <- list('Content-Type' = 'application/json')

  intRes <- curlPerform(customrequest = "PUT",
            url = adrString,
            postfields = fileData,
            headerfunction = reader$update)


  couchConConv$id <- ""
## better returnig a list structure...
  ## ... tomorrow ...
  return( intRes)
}
}
