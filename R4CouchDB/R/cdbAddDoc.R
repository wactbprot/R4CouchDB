cdbAddDoc <- function( cdb){

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$DBName ==""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ", sep=" ")
  }

  if( (length(cdb$dataList) < 1)){
    cdb$error <- paste(cdb$error, " no cdb$dataList given ", sep=" ")
  }

  if(cdb$id == ""){

    cdb$queryParam <- "count=1"
    cdb <- cdbGetUuids(cdb)

  }

  if( cdb$error =="" ){

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    data <- toJSON(cdb$dataList)

    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl,
                  postfields = data
                  )

    cdb$res <- fromJSON( res )

    return( cdb )

  }else{

    stop( cdb$error )

  }
}
