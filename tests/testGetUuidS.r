source("load.r")

context("testing cdbGetUuidS()")

test_that("error msg generated", {
    
    cdb$serverName <- ""
    expect_that(cdbGetUuidS(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
    
    cdb$serverName <- testConsts$server
    cdb$count      <- 0
    
    expect_that(cdbGetUuidS(cdb), throws_error(
        "^.*cdb\\$count is not numeric or smaller than 1"
        ))

})

test_that("base functionality of cdbGetUuidS()", {
    
   cdb$serverName <- testConsts$server
   cdb$count      <- 100
   uuids          <- unlist(cdbGetUuidS(cdb)$res$uuids)
   
   expect_that(length(uuids), equals(100))
               
})
