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


    res <- getURL(adrString,
                  customrequest = "GET"
                  )

    cdb$res <- fromJSON(res)

    return( cdb )

  }else{

    stop( cdb$error )
  }
}
