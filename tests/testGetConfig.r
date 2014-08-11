source("load.r")

context("testing cdbGetConfig()")

test_that("error msg generated", {
    cdb$serverName <- ""
    expect_that(cdbGetConfig(cdb), throws_error(
        "^.*no cdb\\$serverName given"
        ))
})


test_that("base functionality of cdbGetConfig()", {
    
    cdb$serverName <- testConsts$server

    res <- cdbGetConfig(cdb)$res
    
    expect_that(is.list(res$log),         equals(TRUE))
    expect_that(is.list(res$daemons),     equals(TRUE))
    expect_that(is.list(res$vendor),      equals(TRUE))
    expect_that(is.list(res$attachments), equals(TRUE))
    expect_that(is.list(res$replicator),  equals(TRUE))
    expect_that(is.list(res$httpd),       equals(TRUE))
    expect_that(is.list(res$couchdb),     equals(TRUE))
})
