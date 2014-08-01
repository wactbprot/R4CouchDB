srcPath       <- "../R4CouchDB/R/"
fn            <- list.files(srcPath, pattern="R$")

for (k in 1:length(fn)){
  source(paste(srcPath, fn[k], sep=""))
}

library(RCurl)
library(RJSONIO)
library(testthat)
