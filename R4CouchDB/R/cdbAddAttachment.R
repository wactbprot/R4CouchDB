#' Add attachments
#'
#' This function adds attachments to a database document.
#'
#' The function uses  \code{guessMIMEType()} to do exactly this.
#' If the switch \code{cdb$attachmentsWithPath} is set to \code{TRUE}
#' the attachments were saved with path which is the default since version
#' 0.2.5 of R4CouchDB
#'
#' @usage cdbAddAttachment(cdb)
#' @param cdb The list \code{cdb} has to contain
#' \code{cdb$fileName},\code{cdb$serverName}, \code{cdb$DBName} and a
#' \code{cdb$id}.
#' @return \item{cdb}{The result is stored in \code{cdb$res} }
#' @author wactbprot
#' @export
#' @examples
#' \dontrun{
#' ccc            <- cdbIni(DBName="r4couch_db")
#' ccc$dataList   <- list(normalDistRand =  rnorm(20))
#' ccc            <- cdbAddDoc(ccc)
#'# make a 3d plot (stolen from ?persp)
#' x              <- seq(-10, 10, length= 30)
#' y              <- x
#' f              <- function(x,y) {r <- sqrt(x^2+y^2); 10 * sin(r)/r }
#' z              <- outer(x, y, f)
#'
#' z[is.na(z)]    <- 1
#' op             <- par(bg = "black")
#' ccc$fileName   <- "3dplot.pdf"
#'
#' pdf(ccc$fileName)
#' persp(x, y, z,
#'       theta = 30,
#'       phi = 30,
#'       expand = 0.5,
#'       col = "lightblue")
#' dev.off()
#' # add the plot as attachment to the database
#' # it workes over  ccc$fileName
#' ccc            <- cdbAddAttachment(ccc)
#'}
#' @keywords misc
#'

cdbAddAttachment <- function( cdb){

    fname <- deparse(match.call()[[1]])
    cdb   <- cdb$checkCdb(cdb, fname)

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
