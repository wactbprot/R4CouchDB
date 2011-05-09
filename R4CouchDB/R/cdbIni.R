cdbIni <- function(){
  ## http://www.omegahat.org/RJSONIO/
  ## thanx to Duncan Temple Lang
  rc <- library(RCurl, logical.return = TRUE)
  rj <- library(RJSONIO, logical.return = TRUE)

  if(rc && rj){

    cdb <- list(
                serverName = "localhost",
                port = "5984",
                prot = "http",
                uname="",
                pwd="",
                curl=getCurlHandle(),
                DBName="",
                newDBName="",
                removeDBName="",
                id="",
                dataList=list(),
                fileName="",
                design="",
                view="",
                list="",
                queryParam="",
                date=toString(Sys.Date()),
                error="",
                res=""
                )

    cdb$opts <- function(cdb){
      if(cdb$uname == ""){
        opts <- curlOptions(header = FALSE)
      }else{
        opts <- curlOptions(header = FALSE,
                            httpauth = 1L,
                            userpwd=paste(cdb$uname,":",cdb$pwd,sep=""))
      }
      return(opts)
    }

    cdb$baseUrl <- function(cdb){
      baseUrl <- paste(cdb$prot,"://",cdb$serverName,":",cdb$port,"/", sep="")
      return(baseUrl)
    }

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
