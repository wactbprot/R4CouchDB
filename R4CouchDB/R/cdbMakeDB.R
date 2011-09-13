cdbMakeDB <- function(cdb){
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
                  curl=cdb$curl,
                  .opts =cdb$opts(cdb))
    
    cdb$DBName    <- cdb$newDBName
    cdb$newDBName <- ""

    return(cdb$checkRes(cdb,res))
    
  }else{
    stop(cdb$error)
  }
}

