cdbDeleteDoc <- function( cdb){

  if( cdb$id == ""){
    cdb$error <- "no cdb$id given"
    return( cdb)
  }else{

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

    res <-  getURL(
                   adrString ,.opts = list(customrequest = "DELETE")
                   )

    cdb$res <- fromJSON(res)

    return( cdb )

  }
}
