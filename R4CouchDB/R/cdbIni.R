#' Ini function
#'
#' Function returns a list with some default settings and often used functions
#' such as \code{cdb$baseUrl}.
#'
#' The list: \code{ cdb <- list(serverName = "localhost", ... )} is returned if
#' the packages \code{library(RCurl)} and \code{library(RJSONIO)} are
#' successfully loaded.
#'
#' @author wactbprot
#' @export
#' @usage cdbIni(serverName="localhost", port="5984", DBName="", prot = "http", uname = "", pwd = "", newDBName = "", removeDBName = "", id  = "", dataList = list(), fileName = "", design = "", view = "", list = "", queryParam = "", encSub = "?", attachmentsWithPath=TRUE, digits = 7)
#' @param serverName server name
#' @param port port
#' @param DBName name of database
#' @param prot name of the protocol default is http
#' @param uname name of the user
#' @param pwd password
#' @param newDBName name of the database for cdbMakeDB()
#' @param removeDBName name of the database to remove with cdbRemoveDB()
#' @param id the document id to get, put, post or delete
#' @param dataList a list containing data to post or update
#' @param fileName for use in cdbAddAttachment
#' @param design the name of the design used when asking a view or list
#' @param view the name of the view to query
#' @param list the name of the list to query
#' @param queryParam additional query params
#' @param encSub a character which is used as a replacement for chars who can not be converted by iconv
#' @param attachmentsWithPath effects the result of the function cdbAddAttachment in the way the variable is named
#' @param digits digits kept at toJSON conversion
#' @export
#' @examples
#'\dontrun{
#' ccc <- cdbIni(digits=13,
#'               DBName="r4couch_db",
#'               attachmentsWithPath=FALSE,
#'               dataList=list(normalDistRand =  rnorm(20)))
#'}
#' @return \item{cdb}{The R4CouchDB (method) chain(ing) list }
#' @keywords misc
#'

cdbIni <- function(serverName   = "localhost",
                   port         = "5984",
                   DBName       = "",
                   prot         = "http",
                   uname        = "",
                   pwd          = "",
                   newDBName    = "",
                   removeDBName = "",
                   id           = "",
                   dataList     = list(),
                   fileName     = "",
                   design       = "",
                   view         = "",
                   list         = "",
                   queryParam   = "",
                   encSub       = "?",
                   attachmentsWithPath = TRUE,
                   digits       = 7){


    cdb <- list(
        DBName       = DBName,
        serverName   = serverName,
        prot         = prot,
        port         = port,
        uname        = uname,
        pwd          = pwd,
        newDBName    = newDBName,
        removeDBName = removeDBName,
        id           = id,
        dataList     = dataList,
        fileName     = fileName,
        design       = design,
        view         = view,
        list         = list,
        queryParam   = queryParam,
        encSub       = encSub,
        error        = "",
        res          = "",
        date         = toString(Sys.Date()),
        curl         = getCurlHandle(),
        localEnc     = "UTF-8",
        serverEnc    = "UTF-8",
        attachmentsWithPath = TRUE,
        digits       = digits)

    cdb$opts <- function(cdb){
        if(cdb$uname != "" & cdb$pwd != ""){
            opts <- curlOptions(header = FALSE,
                                httpauth = 1L,
                                userpwd=paste(cdb$uname,":",cdb$pwd,sep=""))
        }else{
            opts <- curlOptions(header = FALSE)
        }
        return(opts)
    }

    cdb$baseUrl <- function(cdb){
        return(paste(cdb$prot,
                     "://",
                     cdb$serverName,
                     ":",
                     cdb$port,
                     "/",
                     sep="")
               )
    }

    cdb$fromJSON <- function(jsn){
        jsn <- iconv(jsn,
                     cdb$serverEnc,
                     cdb$localEnc,
                     sub=cdb$encSub)

        return(fromJSON(jsn,
                        nullValue         = NA,
                        simplify          = FALSE,
                        simplifyWithNames = FALSE))
    }

    cdb$toJSON <- function(lst){
        jsn <- toJSON(lst,
                      collapse = "",
                      digits   = digits)
        jsn <- iconv(jsn,
                     cdb$localEnc,
                     cdb$serverEnc,
                     sub=cdb$encSub)

        ## one can {"a":"\r"} have in the
        ## database but one can not send it
        ## this way. A \r is here replaced by \\r
        ## resulting in \r in the database
        jsn <- gsub("\\r","\\\\r",jsn)

        return(jsn)
    }

    cdb$getDocRev <- function(cdb){
        adrString <- paste(cdb$baseUrl(cdb),
                           cdb$DBName,"/",
                           cdb$id,
                           sep="")
        res <- url.exists(adrString, .header=TRUE)["ETag"]
        if(is.na(res)){
            return(NA)
        }else{
            return(paste("", gsub("\\\"", "", res), sep = ""))
        }
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
}
