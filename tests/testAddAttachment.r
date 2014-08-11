source("load.r")

context("testing cdbAddAttachment()")

test_that("error msg generated", {
    
    expect_that(cdbAddAttachment(cdb), throws_error(
        "^.*no cdb\\$id given"
        ))
    
    cdb$id <- testConsts$id
    expect_that(cdbAddAttachment(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))

    cdb$DBName <- testConsts$db    
    expect_that(cdbAddAttachment(cdb), throws_error(
        "^.*no cdb\\$fileName given"
        ))

    cdb$fileName <- "not-available.pdf"    
    expect_that(cdbAddAttachment(cdb), throws_error(
        "^.*no cdb\\$fileName given or not-available.pdf does not exist"
        ))

    cdb$id <- "not-available"
    expect_that(cdbAddAttachment(cdb), throws_error(
        "^.*document cdb\\$id does not exist"
        ))
})

test_that("base functionality of cdbAddAttachment()", {
    
    cdb$id       <- testConsts$id
    cdb$DBName   <- testConsts$db
    cdb$fileName <- testConsts$fileName
    
    res          <- cdbAddAttachment(cdb)$res 
    expect_that(res$ok, equals(TRUE))
    
})
