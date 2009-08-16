## http://www.omegahat.org/RJSONIO/
## thanx to Duncan Temple Lang
rc <- library(RCurl, logical.return = TRUE)
rj <- library(RJSONIO, logical.return = TRUE)

if(rc && rj){

  ##  ccc would be better need a shorter name ...^-^
  couchConConv <- list(
                       serverName = "localhost",
                       port = "5984",
                       noOfUuids="1",
                       databaseName="",
                       newDatabaseName="",
                       id="",
                       rev="",
                       postFile="",
                       putFile="",
                       jsonStruct="",
                       date=toString( Sys.Date()),
                       error="",
                       res=""
                       )
  ##
  ## using source() as long as a package
  ## much more work ...
  ## problem: only the structure named 'couchConConv'
  ## is updated while calling the functions ...
  ## solve: make local=TRUE and give always the
  ## ccc as return
  ##
  ## at this state I think it could be more ...
  ## it is easy possible to _log_  calls and retuns of function calls
  ## in a special couch !!!
  ##
  ##
  ## forget loging for the moment
  ## its just has to run ...
  source("getUuids.R"          ,local = TRUE)
  source("listDatabases.R"     ,local = TRUE)
  source("makeDatabase.R"      ,local = TRUE)
  source("addDoc.R"            ,local = TRUE)
  source("removeDatabase.R"    ,local = TRUE)
  source("getDoc.R"            ,local = TRUE)

}else{
  ## libs can be loaded online ...
}
