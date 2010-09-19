cdbRemoveDB <- function(cdb){

  if(cdb$serverName == ""){
    cdb$error <- paste(cdb$error," no cdb$serverName given")
  }

  if(cdb$removeDBName == ""){
    cdb$error <- paste(cdb$error, "no cdb$removeDBName given")
  }else{

    DBNames <- cdbListDB(cdb)$res
    DBexists <- which(DBNames == cdb$removeDBName)

    if(length(DBexists) == 0){

      cdb$error <- paste(cdb$error,
                         " there is no DB called >",
                         cdb$removeDBName, "< on >",
                         cdb$serverName ,"<")
    }
  }

  if( cdb$error == ""){

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$removeDBName,
                       sep="")

    res <- getURL(adrString,
                  curl=cdb$curl,
                  customrequest = "DELETE"
                  )

    cdb$res <- fromJSON(res)

    ## the DB should be history
    cdb$removeDBName <- ""
    return( cdb )

  }else{

      stop( cdb$error )
    }
}
