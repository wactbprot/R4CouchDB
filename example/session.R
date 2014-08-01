#'
#' R4CouchDB example session
#'
#' @author wactbprot
#'
#' This code thinks you are in the
#' example folder; if you are not execute:
#' > setwd("path/to/example")
#'
#' load the R4CouchDB functions
#' by means of the source command.
#'
srcPath       <- "../R4CouchDB/R/"
fn            <- list.files(srcPath, pattern="R$")
for (k in 1:length(fn)){
  source(paste(srcPath, fn[k], sep=""))
}

#' but we need the RCurl & RJSONIO lib
library(RCurl)
library(RJSONIO)

#' At first one have to generate the ini list.
#' This list (here ccc) contains everything
#' you need for  the connection.
ccc           <- cdbIni()
#' one can do some auth settings
#' ccc$uname <- "user.name"
#' ccc$pwd   <- "pass.word"
#'
#' database list please
ccc           <- cdbListDB(ccc)
ccc$res

ccc$queryParam <- "count=10"
#' writes the id now to ccc$res:
cdbGetUuidS(ccc)$res
#' reset queryParam e.g. for cdbGetView()
ccc$queryParam <- ""
#' writes the id to ccc$id
ccc            <- cdbGetUuid(ccc)
ccc$id

#'
#' the paste() with id makes sure that the db don't exist
#'
ccc$newDBName  <- paste("r4couchdb_",
                        ccc$id,
                        sep="")
ccc            <- cdbMakeDB(ccc)
ccc$res

#'
#' generate some data and add to dataList
ccc$dataList   <- list(normalDistRand =  rnorm(20))
ccc            <- cdbAddDoc(ccc)
#'
#' since v0.6 her ccc$dataList
#' contains the _id and _rev key
#' everything ok?
cdbGetDoc(ccc)$res

#'
#' try cdbUpdateDoc(ccc)
ccc$dataList$Date <- date()
ccc               <- cdbUpdateDoc(ccc)
#'
#' make a 3d plot (stolen from ?persp)
x     <- seq(-10, 10, length= 30)
y     <- x
f     <- function(x,y) {r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z     <- outer(x, y, f)
#'
z[is.na(z)]  <- 1
op           <- par(bg = "black")
ccc$fileName <- "3dplot.pdf"

pdf(ccc$fileName)
persp(x, y, z,
      theta = 30,
      phi = 30,
      expand = 0.5,
      col = "lightblue")
dev.off()
#' add the plot as attachment to the database
#' it workes over  ccc$fileName
ccc   <- cdbAddAttachment(ccc)

#'  remove the db when ready
if(FALSE){
  ccc$removeDBName  <- ccc$DBName
  cdbRemoveDB(ccc)$res
}
