cdbIni <- function(serverName="localhost",port="5984",dbname=""){
  ## http://www.omegahat.org/RJSONIO/
  ## thanx to Duncan Temple Lang
  rc <- library(RCurl, logical.return = TRUE)
  rj <- library(RJSONIO, logical.return = TRUE)

  if(rc && rj){

    cdb <- list(
                serverName = serverName,
                port = port,
                prot = "http",
                uname="",
                pwd="",
                curl=getCurlHandle(),
                DBName=dbname,
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

    cdb$fromJSON <- function(jsn){
      lst <- fromJSON(jsn,
                      nullValue = NA,
                      simplify=FALSE,
                      simplifyWithNames=FALSE)
      return(lst)
    }
    
    cdb$toJSON <- function(lst){
     jsn <- iconv(toJSON(lst), "latin1", "UTF-8")
     return(jsn)
    }
    
    cdb$checkRes <- function(cdb,res){
      if(!(cdb$error == "")){
        stop( cdb$error )
      }
      
      res <- cdb$fromJSON(res)
      
      if(!(length(res$error) > 0)){
        cdb$res <- res
        return( cdb )
      }else{
        stop(paste(cdb$error, res$error,res$reason))
      }
    }
    return( cdb )
  }else{

    eTxt <- paste("RCurl loaded: ",rc,"\n",
                  "RJSONIO loaded: ",rj)
    stop(eTxt)
  }
}
