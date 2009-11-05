cdbIni <- function(){
  ## http://www.omegahat.org/RJSONIO/
  ## thanx to Duncan Temple Lang
  rc <- library(RCurl, logical.return = TRUE)
  rj <- library(RJSONIO, logical.return = TRUE)

  if(rc && rj){

    cdb <- list(
                curl=getCurlHandle(),
                serverName = "",
                port = "5984",
                DBName="",
                newDBName="",
                removeDBName="",
                id="",
                rev="",
                dataList=list(),
                design="",
                view="",
                queryParam="",
                date=toString(Sys.Date()),
                error="",
                res=""
                )
      return( cdb )
    }else{

    eTxt <- paste("RCurl loaded: ",rc,"\n",
                  "RJSONIO loaded: ",rj)

    cdb$error <- eTxt
    return( cdb )

    ## libs can be loaded online ...
    ## ... later
  }
}
