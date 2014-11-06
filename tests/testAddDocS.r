source("load.r")

context("testing cdbAddDocS()")

test_that("error msg generated", {
    
    cdb$dataList <- c()
    cdb$DBName   <- testConsts$db
    expect_that(cdbAddDocS(cdb), throws_error(
        "^.*cdb\\$dataList is not a list"
        ))
    
    cdb$dataList <- list()
    cdb$DBName   <- testConsts$db
    expect_that(cdbAddDocS(cdb), throws_error(
        "^.*cdb\\$dataList has length zero"
        ))
    
    cdb$dataList <- list(a=2)
    cdb$DBName   <- testConsts$db
    expect_that(cdbAddDocS(cdb), throws_error(
        "^.*cdb\\$dataList is not a list of lists"
    ))
    
    cdb$dataList <- list(list(a=1), list(b=2))
    cdb$DBName   <- ""
    expect_that(cdbAddDocS(cdb), throws_error(
        "^.*no cdb\\$DBName given"
    ))
})

