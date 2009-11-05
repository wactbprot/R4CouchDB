cdbDeleteDoc <- function( cdb){

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


    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$DBName,"/",
                       cdb$id,
                       "?rev=",
                       cdb$rev,
                       sep="")

    res <- getURLContent(customrequest = "DELETE",
                         curl=cdb$curl,
                         url = adrString
                         )

    cdb$res <- fromJSON(res)

    return( cdb )

  }else{

    return( cdb)
  }

}
