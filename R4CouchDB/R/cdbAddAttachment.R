#' Add Attachments
#' 
#' This function adds attachments to a doc.
#' 
#' The function uses a simple call to \code{strsplit(fileName, ".")} and takes
#' the last entry of the resulting vector as the \code{Content-Type} in the
#' \code{httpheader}.
#' 
#' @usage cdbAddAttachment(cdb)
#' @param cdb The list \code{cdb} has to contain
#' \code{cdb$fileName},\code{cdb$serverName}, \code{cdb$DBName} and a
#' \code{cdb$id}.
#' @return \item{cdb}{The result is stored in \code{cdb$res} }
#' @author wactbprot
#' @export
#' @keywords misc
#' @examples
#' 
#' 
#'# make a png (stolen from ?persp)
#' x <- seq(-10, 10, length= 30)
#'       y <- x
#'       f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
#'       z <- outer(x, y, f)
#'       z[is.na(z)] <- 1
#'       op <- par(bg = "white")
#'
#' cdb            <- cdbIni()
#' cdb$serverName <- "localhost"
#'
#' cdb$DBName     <- "r4couchdb" ## should already exist
#' cdb$fileName   <- paste("../",cdb$DBName,".test.png", sep="")
#' cdb$dataList   <- list(data=list(x=x,y=y,z=z),
#'                         date=cdb$date)
#' cdb            <- cdbAddDoc(cdb)
#' 
#' png(filename=cdb$fileName)
#'       persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
#' dev.off()
#' 
#' ## finaly the reason why we are here:
#' cdb            <- cdbAddAttachment(cdb)
#' 
