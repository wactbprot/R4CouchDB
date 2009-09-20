cdbDeleteDoc <- function( cdb){

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$DBName ==""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ", sep=" ")
  }

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"
    return( cdb)
  }

  if(cdb$error == ""){

    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    ## it's important to say which
    ## revision should be deleted

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       "?rev=",
                       cdb$rev,
                       sep="")

    res <-  getURL(
                   adrString ,.opts = list(customrequest = "DELETE")
                   )

    cdb$res <- fromJSON(res)

    return( cdb )

  }
}
