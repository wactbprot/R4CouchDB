library(RUnit)
## library(R4CouchDB)


srcPath <- "../R4CouchDB/R/"

fn <- list.files(srcPath, pattern="R$")

for (k in 1:length(fn)) source(paste(srcPath,fn[k],sep=""))


logPath <- "../log/"

track <- tracker()
track$init()

## example section with code inspection

ccc <- inspect(
               cdbIni(),
               track = track)

ccc$serverName <- "localhost"

ccc <- inspect(
               cdbListDB(ccc)
               , track = track)
ccc$res

ccc$queryParam <- "count=1"

ccc <- inspect(
               cdbGetUuids(ccc)
               ,track = track)

ccc$dataList <- list(normalDistRand =  rnorm(20))

ccc <- inspect(
               cdbAddDoc(ccc)
               ,track = track)

ccc$dataList <- list(ccc$dataList, normalDistRand =  rnorm(20))

ccc <- inspect(
               cdbUpdateDoc(ccc)
               ,track = track)

ccc <- inspect(
               cdbRemoveDB(ccc)
               ,track = track)



resTrack <- track$getTrackInfo()
printHTML.trackInfo(resTrack, baseDir=logPath)
