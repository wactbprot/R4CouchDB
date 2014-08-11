source("load.r")

context("testing cdbListDB()")

test_that("error msg generated", {
    cdb$serverName <- ""
    expect_that(cdbListDB(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
})

test_that("base functionality of cdbListDB()", {
    
    cdb$serverName <- testConsts$server

    ## the test_db should already exist
    ## because testMakeDB() has generated it
    dbs  <- unlist(cdbListDB(cdb)$res)
    i    <- which(dbs %in% c(testConsts$db))
    
    expect_that(length(i), equals(1))
    
})
