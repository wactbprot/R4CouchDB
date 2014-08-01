library(RCurl)
library(RJSONIO)
library(testthat)

srcPath       <- "../R4CouchDB/R/"
fn            <- list.files(srcPath, pattern="R$")

for (k in 1:length(fn)){
  source(paste(srcPath, fn[k], sep=""))
}
noOfChar  = 10000
noOfNum   = 100000

testConsts <- list(db        = "test_db",
                   id        = "test_id",
                   
                   data      = list(
                       noOfChars = noOfChar * length(letters),
                       noOfNum   = noOfNum,
                       chars     = rep(letters, noOfChar),
                       numbers   = 1:noOfNum
                       ))
