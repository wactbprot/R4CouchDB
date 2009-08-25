cdbGetDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"
    return( cdb)
  }else{

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$databaseName,"/",
                       cdb$id,
                       sep="")

    res <- getURLContent(adrString,
                         .opts = list(customrequest = "GET"))

    cdb$res <- fromJSON(res)

    return( cdb )

  }
}
