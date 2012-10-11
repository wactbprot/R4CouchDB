#' Request couchdb config
#' 
#' Function provides access to the \code{_config} api end point
#' 
#' 
#' @param cdb Only the connection settings \code{cdb$port} and
#' \code{cdb$serverName} is needed.
#' @return
#' 
#' \item{cdb }{The result of the request is stored in \code{cdb$re} after
#' converting the answer into a list using \code{fromJSON()}.  }
#' @author wactbprot
#' @export
#' @seealso \code{cdbMakeDB}
#' @references
#' 
#' \url{ http://www.omegahat.org/RCurl/ } \url{
#' http://www.omegahat.org/RJSONIO/ } \url{ http://couchdb.apache.org/ }
#' @keywords misc
