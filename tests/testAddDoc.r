source("load.r")

context("testing cdbAddDoc()")
cdb <- cdbIni()

test_that("error msg generated", {

    cdb$dataList <- list()
    cdb$DBName   <- testConsts$db
    expect_that(cdbAddDoc(cdb), throws_error(
        "^.*no cdb\\$dataList given"
        ))

    cdb$dataList <- testConsts$data
    cdb$DBName   <- ""
    expect_that(cdbAddDoc(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))
})


test_that("base functionality of cdbAddDoc()", {

    cdb$id       <- testConsts$id
    cdb$DBName   <- testConsts$db
    cdb$dataList <- testConsts$data
    
    if(is.na(cdb$getDocRev(cdb))){
        res          <-cdbAddDoc(cdb)$res
        expect_that(res$ok, equals(TRUE))
    }else{
        expect_that(cdbAddDoc(cdb), throws_error(
            "^.*conflict"
            ))
    }
    expect_that(cdbAddDoc(cdb), throws_error(
        "^.*conflict"
        ))
})
