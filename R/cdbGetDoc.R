cdbGetDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"
    return( cdb)
  }else{
    reader <- basicTextGatherer()

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")

    res <- getURLContent(adrString,
                         .opts = list(customrequest = "GET",
                           headerfunction = reader$update))

    cdb$res <- fromJSON(res)

    reader$reset()

    return( cdb )

  }
}
