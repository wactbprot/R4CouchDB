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

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$newDBName,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl)
    
    res <- fromJSON( res )
    
    if(length(res$ok) > 0){
      ## everything worked fine
      cdb$res <- res
      ## newDB is generated,
      ## it's now no longer a new one
      cdb$DBName    <- cdb$newDBName
      cdb$newDBName <- ""
      return(cdb)     
    }else{
      cdb$error <- paste(cdb$error, res$error)
    }
  }
  if(!(cdb$error == "")){
    stop( cdb$error )
  }
}

