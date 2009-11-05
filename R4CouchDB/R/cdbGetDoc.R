cdbGetDoc <- function( cdb){

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if( cdb$id == ""){
    cdb$error <- paste( cdb$error, " no cdb$id given ")
  }

  if(cdb$error == ""){

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")


    res <- getURLContent(adrString,
                         customrequest = "GET",
                         curl=cdb$curl
                         )

    cdb$res <- fromJSON(res)

    return( cdb )

  }else{

    return( cdb)
  }
}
