cdbIni <- function(){
  ## http://www.omegahat.org/RJSONIO/
  ## thanx to Duncan Temple Lang
  rc <- library(RCurl, logical.return = TRUE)
  rj <- library(RJSONIO, logical.return = TRUE)

  if(rc && rj){

    ##  ccc would be better need a shorter name ...^-^
    cdb <- list(
                serverName = "localhost",
                port = "5984",
                DBName="",
                newDBName="",
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

    ##
    ## using source() as long as a package
    ## much more work ...
    ## problem: only the structure named 'cdb'
    ## is updated while calling the functions ...
    ## solve: make local=TRUE and give always the
    ## 'cdb' as return
    ##
    ## at this state I think it could be more ...
    ## it is easy possible to _log_  calls and retuns of function calls
    ## in a special couch !!!
    ##
    ##
    ## forget loging for the moment
    ## its just has to run ...

    ## renaming jsonStruct to dataList

    ## noOfUuids="1" can be replaced by ?count=1
    ## it is a queryParam

## source("cdbGetUuids.R"       ,local = TRUE)
## source("cdbListDB.R"         ,local = TRUE)
## source("cdbMakeDB.R"         ,local = TRUE)
## source("cdbAddDoc.R"         ,local = TRUE)
## source("cdbRemoveDB.R"       ,local = TRUE)
## source("cdbGetDoc.R"         ,local = TRUE)
## source("cdbUpdateDoc.R"      ,local = TRUE)
## source("cdbGetView.R"        ,local = TRUE)

    return( cdb )

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
