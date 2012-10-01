##
## R4CouchDB example session
##

srcPath <- "../R4CouchDB/R/"
fn <- list.files(srcPath, pattern="R$")

for (k in 1:length(fn)){
  source(paste(srcPath,fn[k],sep=""))
}

ccc            <- cdbIni()

## here one can do some auth settungs 
## ccc$uname <- "user.name"
## ccc$pwd   <- "pass.word"

## database list please
ccc            <- cdbListDB(ccc)
ccc$res

ccc$queryParam <- "count=10"
## writes the id now to ccc$res:
cdbGetUuidS(ccc)$res
## reset queryParam e.g. for cdbGetView()
ccc$queryParam <- ""

## writes the id to ccc$id
ccc            <- cdbGetUuid(ccc)
ccc$id

## the paste() with id makes sure that the db don't exist
ccc$newDBName  <- paste("r4couchdb_", ccc$id, sep="")
ccc            <- cdbMakeDB(ccc)
ccc$res

## generate some data and add to dataList
ccc$dataList   <- list(normalDistRand =  rnorm(20))
ccc            <- cdbAddDoc(ccc)

## since v0.6 her ccc$dataList
## contains the _id and _rev key
## everything ok?
cdbGetDoc(ccc)$res

## try cdbUpdateDoc(ccc)
ccc$dataList$Date <- date()
ccc               <- cdbUpdateDoc(ccc)

## make a png (stolen from ?persp)
x     <- seq(-10, 10, length= 30)
y     <- x
f     <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z     <- outer(x, y, f)
z[is.na(z)]  <- 1
op    <- par(bg = "white")
ccc$fileName <- paste("../",ccc$DBName,".test.png", sep="")
ccc$dataList <- list(data=list(x=x,y=y,z=z),
                     date=ccc$date)

png(filename=ccc$fileName)
persp(x, y, z,
      theta = 30,
      phi = 30,
      expand = 0.5,
      col = "lightblue")
dev.off()

## add the plot as attachment to the db
ccc   <- cdbAddAttachment(ccc)

##
## remove the db when ready
## ccc$removeDBName  <- ccc$newDBName
## ccc <- cdbRemoveDB(ccc)
##
