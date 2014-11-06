#' Generates a new document
#'
#' This function adds multiple documents to an already existing database
#'
#' This function is called addDocS (which means add some document). Therefore
#' the \code{cdb$id} is requested using \code{cdbGetUuid()} for every document
#' to add if no \code{cdb$id} is provided. If a \code{cdb$id} is provided the
#' function fails when a document with the given id already exists. In this
#' case one should use \code{cdbUpdateDoc()}. Since version v0.6 the function
#' writes the \code{_rev} and \code{_id} key to the top level of
#' \code{cdb$dataList}.
#'
#' @usage cdbAddDocS(cdb)
#' @param cdb The list \code{cdb} only has to contain a \code{cdb$dataList}
#' which is not an empty \code{list()}.
#' @return \item{cdb}{The couchdb response is stored in \code{cdb$res} }
#' @author wactbprot
#' @export
#'@examples
#'\dontrun{
#' ccc               <- cdbIni()
#' # I assume a database at localhost:5984 already exists
#' ccc$DBName        <- "r4couchdb_db"
#' ccc$dataList      <- list(normalDistRand =  rnorm(20))
#' ccc               <- cdbAddDoc(ccc)
#'
#'}
#'
#' @seealso \code{cdbGetDoc()}
#' @keywords misc
#'

cdbAddDocS <- function( cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  if(cdb$error == ""){

    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       "_bulk_docs",
                       sep="")
    
    pf  <- paste0('{"docs":',cdb$toJSON(cdb$dataList),'}')
     
    res <- getURL(utils::URLencode(adrString),
                  customrequest   = 'POST',
                  postfields      = pf,
                  httpheader      = c('Content-Type: application/json;charset=utf-8'),
                  .opts           = cdb$opts(cdb),
                  curl            = cdb$curl)
    res <- cdb$fromJSON( res )
    if(length(res$error) == 0){
	    tmp <- sapply(res,"[")
      cdb$dataList$'_id' <- unlist(tmp["id",])
      cdb$dataList$'_rev' <- unlist(tmp["rev",])
      cdb$res <- res
      return( cdb )
    }else{
      cdb$error <- paste(cdb$error, res$error)
    }
  }

  if(!(cdb$error == "")){
    stop( cdb$error )
  }
}
