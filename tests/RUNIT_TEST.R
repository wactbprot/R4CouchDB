library(RUnit)
## library(R4CouchDB)

## loading the src files here ...
srcPath <- "../R4CouchDB/R/"
fn <- list.files(srcPath, pattern="R$")
## ... means ...
for (k in 1:length(fn)) source(paste(srcPath,fn[k],sep=""))
##... no need to build packages

logPath <- "../log/"

if(FALSE){

  testSuite.cdb <- defineTestSuite("R4CouchDB test suite", dirs=".",
                                   testFileRegexp="^runit.+R$",
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
