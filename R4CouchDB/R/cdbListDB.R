#' Returns all databases on the server
#' 
#' Gives a list of all databases available at \code{cdb$serverName}.
#' 
#' The function uses the CouchDB API end point:
#' \url{http://localhost:5984/_all_dbs} 
#' 
#' @usage cdbListDB(cdb)
#' @param cdb Only the connection settings \code{cdb$port} and
#' \code{cdb$serverName} is needed.
#' @return
#' 
#' \item{cdb }{The result of the request is stored in cdb$res after converting
#' the json answer into a list using \code{cdb$fromJSON()}.}
#' @author wactbprot
#' @export
#' @examples
#' \dontrun{
#' cdbListDB(cdbIni())$res
#'}
#' @seealso \code{cdbMakeDB}
#' @references
#' \url{ http://www.omegahat.org/RCurl/ } \url{
#' http://www.omegahat.org/RJSONIO/ } \url{ http://couchdb.apache.org/ }
#' @keywords misc

cdbListDB <- function(cdb){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  
  if(cdb$error == ""){
    adrString <- paste(cdb$baseUrl(cdb), "_all_dbs",
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "GET",
                  curl=cdb$curl
                  )
    return(cdb$checkRes(cdb,res))
  }else{
    stop(cdb$error)
  }
}
