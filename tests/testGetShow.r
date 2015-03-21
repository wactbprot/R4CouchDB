source("load.r")

context("testing cdbGetShow()")

test_that("error msg generated", {

    cdb$serverName <- ""
    cdb$design     <- testConsts$design
    cdb$show       <- testConsts$show
    cdb$id         <- testConsts$id
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetShow(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
    
    cdb$design     <- testConsts$design
    cdb$show       <- testConsts$show
    cdb$id         <- testConsts$id
    cdb$serverName <- testConsts$server
    cdb$DBName     <- ""
    expect_that(cdbGetShow(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- ""
    cdb$id         <- testConsts$id
    cdb$show       <- testConsts$show
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetShow(cdb), throws_error(
        "^.*no cdb\\$design given"
        ))

    cdb$serverName <- testConsts$server
    cdb$design     <- testConsts$design
    cdb$id         <- ""
    cdb$show       <- testConsts$show
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetShow(cdb), throws_error(
        "^.*no cdb\\$id given"
        ))
    
    cdb$serverName <- testConsts$server
    cdb$design     <- testConsts$design
    cdb$view       <- testConsts$view
    cdb$show       <- ""
    cdb$DBName     <- testConsts$db
    expect_that(cdbGetShow(cdb), throws_error(
        "^.*no cdb\\$show given"
        ))
})
