#' Function for request a number of ids
#' 
#' Function returns a 128bit uuid requested from CouchDB
#' 
#' Simple CouchDB API end point to http://serverName:port/_uuids. The number N
#' of ids received from a CouchDB can be set by \code{cdb$queryParam <-
#' paste("count=", N, sep="")}.  The function writes to cdb$res (in opposite to
#' \code{cdbGetUuid()} whitch writes to \code{cdb$id})
#' 
#' @param cdb Only the connection settings \code{cdb$port} and
#' \code{cdb$serverName} is needed.
#' @return
#' 
#' \item{cdb }{The result of the request is stored in \code{cdb$res} after
#' converting the answer into a list using \code{fromJSON()}.  }
#' @author wactbprot
#' @export
#' @examples
#'\dontrun{
#' ccc               <- cdbIni()
#' ccc$queryParam    <- "count=10"
#' cdbGetUuidS(ccc)$res
#' # better clear params in order to avoid
#' # unwanted side effects
#' ccc$queryParam    <- ""
#'}
#' @seealso \code{cdbMakeDB}
#' @references
#' 
#' \url{ http://www.omegahat.org/RCurl/ } \url{
#' http://www.omegahat.org/RJSONIO/ } \url{ http://couchdb.apache.org/ }
#' @keywords misc
#'

cdbGetUuidS <- function(cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if (cdb$error == ""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste("?",cdb$queryParam, sep="")
    }
    adrString     <- paste(cdb$baseUrl(cdb),
                           "_uuids",
                           queryString,
                           sep="")
    
    res <- getURL(utils::URLencode(adrString),
                  customrequest = "GET",
                  curl=cdb$curl
                  )
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop(cdb$error)
  }
}
