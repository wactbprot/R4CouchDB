source("load.r")

context("testing cdbDeleteDoc()")

test_that("error msg generated", {
    cdb$serverName <- ""
    cdb$DBName     <- ""
    cdb$id         <- ""
    expect_that(cdbDeleteDoc(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
    cdb$serverName <- testConsts$server
    cdb$DBName     <- ""
    cdb$id         <- ""
    expect_that(cdbDeleteDoc(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))
    cdb$serverName <- testConsts$server
    cdb$DBName     <- testConsts$db
    cdb$id         <- ""
    expect_that(cdbDeleteDoc(cdb), throws_error(
        "^.*no cdb\\$id given"
        ))
})

test_that("base functionality of cdbDeleteDoc()", {

    cdb$serverName <- testConsts$server
    cdb$id         <- testConsts$id
    cdb$DBName     <- testConsts$db

    res          <- cdbDeleteDoc(cdb)$res 
    expect_that(res$ok, equals(TRUE))


})

test_that("error msg generated", {
    
    cdb$serverName <- testConsts$server
    cdb$id         <- testConsts$id
    cdb$DBName     <- testConsts$db
    expect_that(cdbDeleteDoc(cdb), throws_error(
        "^.*server error\\: not_found server reason\\: deleted"
        ))
})
