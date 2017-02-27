#' Receive show results from CouchDB
#' 
#' The function provides accesses to CouchDB shows.
#'
#' Query params e.g. \code{"format=json"}  can be
#' provided in \code{cdb$queryParam}. Multible params must be given in
#' one string e.g.  \code{"a=b&c=d&e=f"}.
#' 
#' @usage cdbGetShow(cdb)
#' @param cdb Beside the connection details (\code{cdb$port}, \code{cdb$DBName}
#' ...) the \code{cdb$design} and \code{cdb$show} is needed.
#' @return
#' 
#' \item{cdb }{The result of the request is stored in cdb$res after converting
#' the json answer into a list using \code{cdb$fromJSON()}. If a needed cdb
#' entry was not provided \code{cdb$error} provides information.
#' 
#' }
#' @author wactbprot
#' @export
#' @keywords misc
#'

cdbGetShow <- function( cdb ){
  
  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)
  
  if(cdb$error ==""){

    if(cdb$queryParam == ""){
      queryString <- ""
    }else{
      queryString <- paste0("?",cdb$queryParam)
    }

    adrString <- paste0(cdb$baseUrl(cdb), cdb$DBName
                        , "/_design/"
                        , cdb$design
                        , "/_show/"
                        , cdb$show
                        , "/",cdb$id
                        , queryString)
    
    res <- getURL(utils::URLencode(adrString),
                  customrequest = "GET",
                  curl          = cdb$curl,
                  .opts         = cdb$opts(cdb),
                  .encoding     = cdb$serverEnc)
    
    return(cdb$checkRes(cdb,res))
    
  }else{
    stop( cdb$error )
  }
}
