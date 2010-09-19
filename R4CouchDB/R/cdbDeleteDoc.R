cdbDeleteDoc <- function( cdb ){

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$DBName ==""){
    cdb$error <- paste(cdb$error, " no cdb$DBName given ")
  }

  if(cdb$id ==""){
    cdb$error <- paste(cdb$error, " no cdb$id given ")
  }

  if(cdb$error == ""){

    ## it's important to say which
    ## revision should be deleted
    ## brutforce at the moment

    cdb <- cdbGetDoc(cdb)
    cdb$rev <- cdb$res$'_rev'

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       "?rev=",
                       cdb$rev,
                       sep="")

    res <- getURL(adrString,
                  customrequest = "DELETE",
                  curl=cdb$curl
                  )

    cdb$res <- fromJSON(res)

    return( cdb )

  }else{
    stop( cdb$error )
  }
}
