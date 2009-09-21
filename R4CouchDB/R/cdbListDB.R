cdbListDB <- function(cdb){

 if(cdb$serverName == ""){
   cdb$error <- paste(cdb$error," no cdb$serverName given")
 }
 if(cdb$error == ""){
   adrString <- paste("http://",
                      cdb$serverName,":",
                      cdb$port, "/_all_dbs",
                      sep="")

   res <- getURL(adrString)
   cdb$res <- fromJSON(res)
   return( cdb )
  }else{
    print(cdb$error)
    return( cdb )
  }
}
