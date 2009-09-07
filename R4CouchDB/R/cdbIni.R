cdbIni <- function(){
  ## http://www.omegahat.org/RJSONIO/
  ## thanx to Duncan Temple Lang
  rc <- library(RCurl, logical.return = TRUE)
  rj <- library(RJSONIO, logical.return = TRUE)

  if(rc && rj){

    cdb <- list(
                serverName = "localhost",
                port = "5984",
                DBName="r4couch_test_db",
                newDBName="r4couch_test_db",
                id="",
                rev="",
                dataList=list(),
                design="",
                view="",
                queryParam="",
                date=toString( Sys.Date()),
                error="",
                res=""
                )
    cdb <- cdbRemoveDB( cdb )
    cdb <- cdbMakeDB( cdb )
    cdb$res <- ""
    if(cdb$error == ""){
      return( cdb )
    } else {
      cdb$error <- " can not make r4couch_test_db "
      return( cdb )
    }
  }else{
    eTxt <- paste("RCurl loaded: ",rc,"\n",
                  "RJSONIO loaded: ",rj)
    print( eTxt )

    cdb$error <- eTxt
    return( cdb )

    ## libs can be loaded online ...
    ## ... later
  }
}
