#' Ini function
#' 
#' Function returns a list with some default settings and often used functions
#' such as \code{cdb$baseUrl}.
#' 
#' The list: \code{ cdb <- list(serverName = "localhost", ... )} is returned if
#' the packages \code{library(RCurl)} and \code{library(RJSONIO)} are
#' successfully loaded.
#'
#' Thanks Duncan Temple Lang for
#' http://www.omegahat.org/RJSONIO/
#' and
#' http://www.omegahat.org/RCurl/
#' 
#'
#' @author wactbprot
#' @export
#' @usage cdbIni(serverName="localhost",port="5984",dbname="")
#' @param serverName server name 
#' @param port port
#' @param dbname name of database
#' @return \item{cdb}{The R4CouchDB (method) chain(ing) list }
#' 
#' \item{cdb}{see details for the default settings of this function }
#' @keywords misc
#'

cdbIni <- function(serverName="localhost",port="5984",dbname=""){
  rc <- library(RCurl,
                logical.return = TRUE,
                quietly =TRUE)
  rj <- library(RJSONIO,
                logical.return = TRUE,
                quietly =TRUE)
  
  if(rc && rj){
    
    cdb <- list(
      serverName   = serverName,
      port         = port,
      prot         = "http",
      uname        = "",
      pwd          = "",
      curl         = getCurlHandle(),
      DBName       = dbname,
      newDBName    = "",
      removeDBName = "",
      id           = "",
      dataList     = list(),
      fileName     = "",
      design       = "",
      view         = "",
      list         = "",
      queryParam   = "",
      date         = toString(Sys.Date()),
      localEnc     = unlist(strsplit(Sys.getlocale("LC_CTYPE"),"\\."))[2],
      serverEnc    = "UTF-8",
      encSub       = "?",
      error        = "",
      res          = "")
    
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
      return(fromJSON(jsn,
                      nullValue         = NA,
                      simplify          = FALSE,
                      simplifyWithNames = FALSE))
    }
    
    cdb$toJSON <- function(lst){
      jsn <- toJSON(lst, collapse = "")
      ## couchdb has a right to get proper
      ## json. bad requests often came from
      ## stuff like \xa0\xbc\xed. Here we say
      ## gtfo and replace it with cdb$encSub 
      jsn <- iconv(jsn,
                   cdb$localEnc,
                   cdb$serverEnc,
                   sub=cdb$encSub)
      ## one can {"a":"\r"} have in the
      ## database but one can not send it back
      ## in this way. A \r is here replaced by \\r
      ## resulting in \r in the database
       
      jsn <- gsub("\\r","\\\\r",jsn)
      return(jsn)
    }
    
    cdb$checkRes <- function(cdb,res){
      if(!(cdb$error == "")){
        stop( paste("local error:", cdb$error))
      }
      
      res <- cdb$fromJSON(res)
      
      if(length(res$error) > 0){
        stop(paste("local error:", cdb$error,
                   "server error:", res$error,
                   "server reason:", res$reason))
      }else{
        cdb$res <- res
        return( cdb )
      }
    }

    cdb$checkCdb <- function(cdb,fname){

      if(fname == "cdbGetDoc"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.id(cdb)
        cdb <- chk.db.name(cdb)
      }
      
      if(fname == "cdbAddAttachment"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.id(cdb)
        cdb <- chk.db.name(cdb)
        cdb <- chk.file.name(cdb)
      }

      if(fname == "cdbAddDoc"){
         cdb <- chk.server.name(cdb)
         cdb <- chk.db.name(cdb)
         cdb <- chk.data.list(cdb)
       }

      if(fname == "cdbDeleteDoc"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.db.name(cdb)
        cdb <- chk.id(cdb)
      }

      if(fname == "cdbGetConfig"){
        cdb <- chk.server.name(cdb)
      }

      if(fname == "cdbGetList"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.db.name(cdb)
        cdb <- chk.design.name(cdb)
        cdb <- chk.list.name(cdb)
        cdb <- chk.view.name(cdb)
      }

      if(fname == "cdbGetUuid"){
        cdb <- chk.server.name(cdb)
      }

      if(fname == "cdbGetUuidS"){
        cdb <- chk.server.name(cdb)
      }
      
      if(fname == "cdbGetView"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.db.name(cdb)
        cdb <- chk.design.name(cdb)
        cdb <- chk.view.name(cdb)
      }
      
      if(fname == "cdbListDB"){
        cdb <- chk.server.name(cdb)
      }
      
      if(fname == "cdbMakeDB"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.newdb.name(cdb)
      }
      
      if(fname == "cdbRemoveDB"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.rmdb.name(cdb)
      }

      if(fname == "cdbUpdateDoc"){
        cdb <- chk.server.name(cdb)
        cdb <- chk.id(cdb)
        cdb <- chk.db.name(cdb)
        cdb <- chk.data.list(cdb)
      }
      return(cdb)
    }

    ## ----------------------chk.fns-----------------v
    chk.newdb.name <- function(cdb){
      if(cdb$newDBName == ""){
        cdb$error <- paste(cdb$error,
                           ";no cdb$newDBName given")
      }else{
        DBNames  <- cdbListDB(cdb)$res
        DBexists <- which(DBNames == cdb$newDBName)

        if(length(DBexists) > 0){
          cdb$error <- paste(cdb$error,
                             ";cdb$newDBName already exists ")
        }
      }
      return(cdb)
    }
    
    chk.rmdb.name <- function(cdb){
      if(cdb$removeDBName == ""){
        cdb$error <- paste(cdb$error, "no cdb$removeDBName given")
      }else{
        DBNames <- cdbListDB(cdb)$res
        DBexists <- which(DBNames == cdb$removeDBName)
        
        if(length(DBexists) == 0){
          cdb$error <- paste(cdb$error,
                             " there is no DB called >",
                             cdb$removeDBName, "< on >",
                             cdb$serverName ,"<")
        }
      }
      return(cdb)
    }
    
    chk.design.name <- function(cdb){
      if(cdb$design == "") {
        cdb$error <- paste(cdb$error,
                           ";no cdb$design given")
      }
      return(cdb)
    }

    chk.list.name <- function(cdb){
      if(cdb$list == "") {
        cdb$error <- paste(cdb$error,
                           ";no cdb$list given")
      }
      return(cdb)
    }
    
    chk.view.name <- function(cdb){
      if(cdb$view == "") {
        cdb$error <- paste(cdb$error,
                           ";no cdb$view given")
      }
      return(cdb)
    }


    chk.data.list <- function(cdb){
      if( (length(cdb$dataList) < 1)){
        cdb$error <- paste(cdb$error,
                           ";no cdb$dataList given")
      }
      return(cdb)
    }
    
    chk.file.name <- function(cdb){
      if( !(file.exists(cdb$fileName))){
        cdb$error <- paste(cdb$error,
                           ";no cdb$fileName given or",
                           cdb$fileName,
                           "does not exist")
      }
      return(cdb)
    }
    chk.server.name <- function(cdb){
      if(cdb$serverName == ""){
        cdb$error <- paste(cdb$error,
                           ";no cdb$serverName given")
      }
      return(cdb)
    }

    chk.db.name <- function(cdb){
      if(cdb$DBName == ""){
        cdb$error <- paste(cdb$error,
                           ";no cdb$DBName given")
      }
      return(cdb)
    }

    chk.id <- function(cdb){
      if( cdb$id == ""){
        cdb$error <- paste(cdb$error,
                           ";no cdb$id given ")
      }
      return(cdb)
    }
    ## ----------------------chk.fns-----------------^
    
    return( cdb )
  
  }else{

    eTxt <- paste("RCurl loaded: ",rc,"\n",
                  "RJSONIO loaded: ",rj)
    stop(eTxt)
  }
}
