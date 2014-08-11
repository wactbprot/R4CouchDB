source("load.r")

context("testing cdbGetView()")

test_that("error msg generated", {

    cdb$serverName <- ""
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetView(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
    
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$serverName <- testConsts$server
    cdb$DBName     <- ""
    expect_that(cdbGetView(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- ""
    cdb$view       <- testConsts$view
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetView(cdb), throws_error(
        "^.*no cdb\\$design given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- testConsts$design
    cdb$view       <- ""
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetView(cdb), throws_error(
        "^.*no cdb\\$view given"
        ))
    
    
})
