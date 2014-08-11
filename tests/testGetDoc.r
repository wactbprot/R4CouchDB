source("load.r")

context("testing cdbGetDoc()")

test_that("error msg generated", {

    cdb$id     <- ""
    cdb$DBName <- testConsts$db
    expect_that(cdbGetDoc(cdb), throws_error(
        "^.*no cdb\\$id given"
        ))
    
    cdb$id     <- testConsts$id
    cdb$DBName <- ""
    expect_that(cdbGetDoc(cdb), throws_error(
        "^.*no cdb\\$DBName given"
        ))
})

test_that("base functionality of cdbGetDoc()", {
    cdb$DBName <- testConsts$db
    cdb$id     <- testConsts$id
    res        <- cdbGetDoc(cdb)$res
    num        <- unlist(res$numbers)
    char       <- unlist(res$chars)
    
    expect_that(length(char), equals(res$noOfChars))
    expect_that(length(num),  equals(res$noOfNum))
    expect_that(num[1],  equals(1))
    expect_that(char[1],  equals(letters[1]))
})
