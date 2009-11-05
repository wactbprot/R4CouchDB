cdbListDB <- function(cdb){

 if(cdb$serverName == ""){
   cdb$error <- paste(cdb$error," no cdb$serverName given")
 }

 if(cdb$error == ""){

   adrString <- paste("http://",
                      cdb$serverName,":",
                      cdb$port, "/_all_dbs",
                      sep="")

   res <- getURLContent(adrString,
                        customrequest = "GET",
                        curl=cdb$curl
                        )

   cdb$res <- fromJSON(res)

   return( cdb )

 }else{

    return( cdb )
  }
}
