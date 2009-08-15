addDoc <- function( couchConConv){

  if(couchConConv$id == ""){
    couchConConv$noOfUuids <- "1"
    couchConConv$id <- getUuids(couchConConv)$uuids
  }

  if(couchConConv$databaseName ==""){
    couchConConv$error <- "no couchConConv$databaseName given"
    return( couchConConv )
  }

  if((couchConConv$postFile == "") && (couchConConv$jsonStruct == "")){
    couchConConv$error <- "no couchConConv$postFile  or couchConConv$jsonStruct given"
    return( couchConConv )
  }else{

    adrString <- paste("http://",
                       couchConConv$serverName,":",
                       couchConConv$port,"/",
                       couchConConv$databaseName,"/",
                       couchConConv$id,
                       sep="")
    if(couchConConv$postFile != ""){
      data <- paste(readLines(couchConConv$postFile), collapse = "\n")
    }else{
      data <- toJSON(couchConConv$jsonStruct)
    }

    header <- list('Content-Type' = 'application/json')
    reader <- basicTextGatherer()

    couchConConv$res <- curlPerform(customrequest = "POST",
                          url = adrString,
                          postfields = data,
                          headerfunction = reader$update)

    couchConConv$id <- ""
    ## better returnig a list structure...
    ## ... tomorrow ...
    return( couchConConv )
  }
}
