library(RUnit)
## library(R4CouchDB)

## loading the src files here ...
srcPath <- "../R4CouchDB/R/"
fn <- list.files(srcPath, pattern="R$")
## ... means ...
for (k in 1:length(fn)) source(paste(srcPath,fn[k],sep=""))
##... no need to build packages

logPath <- "../log/"

if(TRUE){

  testSuite.cdb <- defineTestSuite("R4CouchDB test suite", dirs=".",
                                   testFileRegexp="^runit.+\.[rR]$",
                                   testFuncRegexp="^test.+",
                                   rngKind="Marsaglia-Multicarry",
                                   rngNormalKind="Kinderman-Ramage")
  testResults <- runTestSuite(
                              testSuite.cdb
                              )

  testFileToSFLinkMap <- function(testFileName, testDir="tests") {
    ##  get unit test file name
    bname <- basename(testFileName)

    return(paste("../tests/", bname, sep=""))
  }


  printHTMLProtocol(testResults,
                    fileName=paste(logPath,"cdb.check.html", sep=""),
                    testFileToLinkMap=testFileToSFLinkMap
                    )
}
## initialize code inspection:

track <- tracker()
track$init()


## example section with code inspection

ccc <- inspect(
               cdbIni(),
               track = track)

ccc$serverName <- "localhost"

ccc$newDBName <- "runit_test_db"
ccc$removeDBName <- ccc$newDBName

ccc <- inspect(
               cdbRemoveDB(ccc)
               , track = track)
ccc$error <- ""

ccc <- inspect(
               cdbListDB(ccc)
               , track = track)
ccc$res

ccc$queryParam <- "count=1"
ccc <- inspect(
               cdbGetUuids(ccc)
               ,track = track)
## ccc has got the uuid in ccc$id
## make a test DB named saveId

ccc$newDBName <- "runit_test_db"


ccc <- inspect(
               cdbMakeDB(ccc)
               ,track = track)

## the function short cuts the ccc$newDBName
## with ccc$DBName

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
