source("load.r")

context("testing cdbGetList()")

test_that("error msg generated", {

    cdb$serverName <- ""
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$list       <- testConsts$list
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetList(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
    
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$list       <- testConsts$list
    cdb$serverName <- testConsts$server
    cdb$DBName     <- ""
    expect_that(cdbGetList(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- ""
    cdb$view       <- testConsts$view
    cdb$list       <- testConsts$list
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetList(cdb), throws_error(
        "^.*no cdb\\$design given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- testConsts$design
    cdb$view       <- ""
    cdb$list       <- testConsts$list
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetList(cdb), throws_error(
        "^.*no cdb\\$view given"
        ))


    cdb$serverName <- testConsts$server
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$list       <- ""
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetList(cdb), throws_error(
        "^.*no cdb\\$list given"
        ))
    
    
})
