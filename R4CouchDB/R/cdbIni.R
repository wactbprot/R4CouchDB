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
                rev="",
                dataList=list(),
                fileName="",
                design="",
                view="",
                queryParam="",
                date=toString(Sys.Date()),
                error="",
                res=""
                )

    cdb$baseUrl <- function(cdb){
      mid <- if(cdb$uname == ""){""}else{paste(cdb$uname,":",cdb$pwd,"@",sep="")}
      baseUrl <- paste(cdb$prot,"://",mid,cdb$serverName,"/", sep="")
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
