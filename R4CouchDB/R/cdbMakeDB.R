cdbMakeDB <- function(cdb){

  ## write test functions!
  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$newDBName == ""){

    cdb$error <- paste(cdb$error," no cdb$newDBName given ")

  }else{

    DBNames <- cdbListDB(cdb)$res
    DBexists <- which(DBNames == cdb$newDBName)

    if(length(DBexists) > 0){

      cdb$error <- paste(cdb$error," cdb$newDBName already exists ")

    }
  }

  if(cdb$error == ""){

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$newDBName,
                       sep="")


    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl
                  )

    cdb$res <- fromJSON( res )

    ## newDB is generated it's now no longer a new one
    cdb$DBName <- cdb$newDBName
    return( cdb )

  }else{
    stop( cdb$error )
  }
}

