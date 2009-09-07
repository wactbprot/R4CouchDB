cdbGetDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"
    return( cdb)
  }else{

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURLContent(customrequest = "DELETE",
                         url = adrString)

    cdb$res <- fromJSON(res)

    return( cdb )

  }
}
