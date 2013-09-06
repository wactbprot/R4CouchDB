#' Add attachments
#'
#' This function adds attachments to a doc.
#'
#' The function uses  \code{guessMIMEType()} to do exactly this.
#' If the switch \code{cdb$attachmentsWithPath} is set to \code{TRUE}
#' the attachments were saved with path.
#'
#' @usage cdbAddAttachment(cdb)
#' @param cdb The list \code{cdb} has to contain
#' \code{cdb$fileName},\code{cdb$serverName}, \code{cdb$DBName} and a
#' \code{cdb$id}.
#' @return \item{cdb}{The result is stored in \code{cdb$res} }
#' @author wactbprot
#' @keywords misc
#'

cdbAddAttachment <- function( cdb){

    fname <- deparse(match.call()[[1]])
    cdb   <- cdb$checkCdb(cdb,fname)

    if(cdb$error == ""){
        tmpN       <- length(tmpFn <- unlist(strsplit(cdb$fileName,"\\.")))
        noOfBytes  <- file.info(cdb$fileName)$size
        con        <- file(cdb$fileName, "rb")
        data       <- readBin(con, n = noOfBytes,raw())

        close(con)

        if(cdb$attachmentsWithPath){
            fbn    <- cdb$fileName
        }else{
            fbn    <- basename(cdb$fileName)
        }
        ctp        <- toString(guessMIMEType(basename(fbn)))
        cdb$rev    <- cdbGetDoc(cdb)$res$'_rev'
        adrString  <- paste(cdb$baseUrl(cdb),
                            cdb$DBName,
                            "/",
                            cdb$id,
                            "/",
                            fbn,
                            "?rev=",
                            cdb$rev,
                            sep = "")

        res        <- getURL(adrString,
                             customrequest = "PUT",
                             postfields    = data,
                             httpheader    = c("Content-Type" = ctp))


        return(cdb$checkRes(cdb,res))

    }else{
        stop(cdb$error)
    }
}
