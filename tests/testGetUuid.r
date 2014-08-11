source("load.r")

context("testing cdbGetUuid()")

test_that("error msg generated", {
    cdb$serverName <- ""
    expect_that(cdbListDB(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
})

test_that("base functionality of cdbGetUuid()", {
    
    cdb$serverName <- testConsts$server
    res            <- cdbGetUuid(cdb)
    
    expect_that(res$id == "", is_false())
    
})
