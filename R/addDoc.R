addDoc <- function( couchConConv){

  if(couchConConv$id == ""){
    couchConConv$noOfUuids <- "1"
    couchConConv <- getUuids(couchConConv)
  }

  if(couchConConv$databaseName ==""){
    couchConConv$error <- "no couchConConv$databaseName given"
    return( couchConConv )
  }

  if((couchConConv$postFile == "") && (length(couchConConv$dataList) < 1)){
    couchConConv$error <- "no couchConConv$postFile  or couchConConv$dataList given"
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
      data <- toJSON(couchConConv$dataList)
    }

    header <- list('Content-Type' = 'application/json')
    reader <- basicTextGatherer()




    #couchConConv$res
    res <- getURLContent(customrequest = "PUT",
                          url = adrString,
                          postfields = data,
                          headerfunction = reader$update)


    couchConConv$res <- toString( res )
    return( couchConConv )

  }
}
