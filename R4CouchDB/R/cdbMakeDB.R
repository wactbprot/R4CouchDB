#' Creates a new database
#' 
#' The name of the new database is taken from \code{cdb$newDBName}.
#' 
#' The work is done by \code{getURL()} from Duncans RCurl package.
#' 
#' After creating the new database the function makes the shortcut
#' \code{cdb$DBName <- cdb$newDBName} so that further operations happen on the
#' new created database. Finaly \code{cdb$newDBName <- ""}.
#' 
#' @usage cdbMakeDB(cdb)
#' @param cdb The \code{cdb} have to provide \code{cdb$serverName},
#' \code{cdb$port} and \code{cdb$newDBName}
#' @return \item{cdb}{The CouchDB answer is stored in \code{cdb$res}. Any
#' problems on the R side are reported in \code{cdb$error} }
#' @note The convention for database naming should be implemented.
#' @author wactbprot
#' @export
#' @seealso \code{cdbUpdateDoc}
#' @references \url{ http://couchdb.apache.org/ }
#' @keywords misc
