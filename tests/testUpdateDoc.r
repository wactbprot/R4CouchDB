source("load.r")

context("testing cdbUpdateDoc()")
cdb <- cdbIni()

test_that("error msg generated", {
    expect_that(cdbUpdateDoc(cdb), throws_error(
        "^.*no cdb\\$dataList given"
        ))
    
    cdb$id     <- ""
    cdb$DBName <- testConsts$db
    expect_that(cdbUpdateDoc(cdb), throws_error(
        "^.*no cdb\\$id given"
        ))
    
    cdb$id     <- testConsts$id
    cdb$DBName <- ""
    expect_that(cdbGetDoc(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))
})

test_that("base functionality of cdbUpdateDoc()", {

    cdb$error    <- ""
    
    cdb$id       <- testConsts$id
    cdb$DBName   <- testConsts$db
    cdb$dataList <- testConsts$data

    for(i in 1:10){
        res          <- cdbUpdateDoc(cdb)$res 
        expect_that(res$ok, equals(TRUE))
    }

})
