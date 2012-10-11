#' Get a doc from CouchDB
#' 
#' With a given \code{cdb$id} this function requests the document.
#' 
#' 
#' @usage cdbGetDoc(cdb)
#' @param cdb Beside \code{cdb$serverName}, \code{cdb$port} and
#' \code{cdb$DBName} the \code{cdb$id} must be given. R errors are reported
#' 
#' in cdb$errors
#' @return
#' 
#' \item{cdb }{The result of the request is stored in \code{cdb$res} after
#' converting the answer into a list using \code{fromJSON()}. If a list entry
#' needed in \code{cdb} is not provided \code{cdb$error} gives some
#' information.
#' 
#' }
#' @author wactbprot
#' @export
#' @seealso \code{cdbAddDoc()}
#' @references
#' 
#' \url{ http://couchdb.apache.org/ } \url{ http://www.omegahat.org/ }
#' @keywords misc
#' @examples
#' 
#' ccc          <- cdbIni()
#' ccc$DBName   <- "r4couchdb" ## should already exist
#' ccc$dataList <- list(normalDistRand =  rnorm(20))
#' ccc          <- cdbAddDoc(ccc)
