cdbListDB <- function(cdb){

 if(cdb$serverName == ""){
   cdb$error <- paste(cdb$error," no cdb$serverName given")
 }

 if(cdb$error == ""){

   adrString <- paste(cdb$baseUrl(cdb), "_all_dbs",
                      sep="")

   res <- getURL(adrString,
                 customrequest = "GET",
                 curl=cdb$curl
                 )

   cdb$res <- fromJSON(res)

   return( cdb )

 }else{

    stop( cdb$error )
  }
}
