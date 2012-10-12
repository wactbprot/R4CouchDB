#' Generates a new document
#' 
#' This function adds a new document to an already existing database
#' 
#' This function is called addDoc (which means add a new document). Therefore
#' the \code{cdb$id} is requested using \code{cdbGetUuid()} for every document
#' to add if no \code{cdb$id} is provided. If a \code{cdb$id} is provided the
#' function fails when a document with the given id already exists. In this
#' case one should use \code{cdbUpdateDoc()}. Since version v0.6 the function
#' writes the \code{_rev} and \code{_id} key to the top level of
#' \code{cdb$dataList}.
#' 
#' @usage cdbAddDoc(cdb)
#' @param cdb The list \code{cdb} only has to contain a \code{cdb$dataList}
#' which is not an empty \code{list()}.
#' @return \item{cdb}{The couchdb response is stored in \code{cdb$res} }
#' @author wactbprot
#' @export
#' @seealso \code{cdbGetDoc()}
#' @keywords misc
#' @examples
#' 
#' ccc            <- cdbIni()
#' ccc$DBName     <- "r4couchdb" ## should already exist
#' ccc$dataList   <- list(normalDistRand =  rnorm(20))
#' 
#' cdbAddDoc(ccc)$res
#' 

cdbAddDoc <- function( cdb){

  fname <- deparse(match.call()[[1]])
  cdb   <- cdb$checkCdb(cdb,fname)

  if(cdb$error == ""){
    if(cdb$id == ""){
      cdb <- cdbGetUuid(cdb)
    }
    
    adrString <- paste(cdb$baseUrl(cdb),
                       cdb$DBName,"/",
                       cdb$id,
                       sep="")
    
    res <- getURL(adrString,
                  customrequest = "PUT",
                  curl=cdb$curl,
                  postfields = cdb$toJSON(cdb$dataList),
                  httpheader=c('Content-Type: application/json'),
                  .opts =cdb$opts(cdb))
    
    res <- cdb$fromJSON( res )
    
    if(length(res$ok) > 0){
      cdb$dataList$'_id' <- res$id
      cdb$dataList$'_rev' <- res$rev
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
