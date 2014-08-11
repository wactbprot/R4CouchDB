source("load.r")

context("testing cdbIni()")

test_that("all defaults are present", {

    expect_that(cdb$serverName    , equals("localhost"))
    expect_that(cdb$port          , equals("5984"))
    expect_that(cdb$prot          , equals("http"))
    expect_that(cdb$DBName        , equals(""))
    expect_that(cdb$uname         , equals(""))
    expect_that(cdb$pwd           , equals(""))
    expect_that(cdb$newDBName     , equals(""))
    expect_that(cdb$removeDBName  , equals(""))
    expect_that(cdb$id            , equals(""))
    expect_that(cdb$fileName      , equals(""))
    expect_that(cdb$design        , equals(""))
    expect_that(cdb$view          , equals(""))
    expect_that(cdb$list          , equals(""))
    expect_that(cdb$queryParam    , equals(""))
    expect_that(cdb$encSub        , equals("?"))
    expect_that(cdb$dataList      , equals( list()))
    expect_that(cdb$digits        , equals(7))
    expect_that(cdb$attachmentsWithPath , equals( TRUE))

})

test_that("all operational values are set", {

    expect_that(cdb$localEnc       , equals("UTF-8"))
    expect_that(cdb$serverEnc      , equals("UTF-8"))
    expect_that(cdb$error          , equals(""))
    expect_that(cdb$res            , equals(""))
})

test_that("Rcurl initializes as expected", {

    expect_that(is.object(cdb$curl), equals(TRUE))
    expect_that(class(cdb$curl)[1], equals("CURLHandle"))
})
