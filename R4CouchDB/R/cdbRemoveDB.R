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
                         " there is no cdb$removeDBName  to delete")

    }
  }

  if( cdb$error == ""){

    adrString <- paste("http://",
                       cdb$serverName,":",
                       cdb$port,"/",
                       cdb$removeDBName,
                       sep="")

    res <- getURLContent(adrString,
                         .opts = list(customrequest = "DELETE")
                         )

    cdb$res <- fromJSON(res)

    ## the DB should be history
    cdb$removeDBName <- ""
      return( cdb )


  }else{
      print(cdb$error)
      return(cdb)
    }
}
