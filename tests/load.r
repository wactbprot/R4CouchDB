library(RCurl)
library(RJSONIO)
library(testthat)

srcPath       <- "../R4CouchDB/R/"
fn            <- list.files(srcPath, pattern="R$")

for (k in 1:length(fn)){
  source(paste(srcPath, fn[k], sep=""))
}

### ~~~~~~~~~~~ generate test data ~~~~~~~~~~~  
## testet with 9MB:
## noOfChar  = 100000
## noOfNum   = 1000000

## usually this should be enough
noOfChar   <- 1000
noOfNum    <- 10000
testConsts <- list(db        = "test_db",
                   design    = "test",
                   view      = "test",
                   list      = "test",
                   show      = "show",
                   server    = "localhost",
                   fileName  = "test.pdf",
                   id        = "test_id",
                   data      = list(
                       noOfChars = noOfChar * length(letters),
                       noOfNum   = noOfNum,
                       chars     = rep(letters, noOfChar),
                       numbers   = 1:noOfNum
                       ))

cdb <- cdbIni()
