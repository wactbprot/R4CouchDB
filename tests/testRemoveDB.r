source("load.r")

context("testing cdbRemoveDB()")
cdb <- cdbIni()

test_that("error msg generated", {
    expect_that(cdbRemoveDB(cdb), throws_error(
        "^.*no cdb\\$removeDBName given"
        ))
})


test_that("base functionality of cdbRemoveDB()", {

    dbs  <- unlist(cdbListDB(cdb)$res)
    i    <- which(dbs %in% c(testConsts$db))

    if(length(i) == 0){
        cdb$newDBName <- testConsts$db
        tmp           <- cdbMakeDB(cdb)
    }
    
    cdb$removeDBName <- testConsts$db
    cdb              <- cdbRemoveDB(cdb)
    
    expect_that(cdb$res$ok, equals(TRUE))
    expect_that(cdb$removeDBName, equals(""))

})

test_that("error msg generated", {
    cdb$removeDBName <- testConsts$db
    expect_that(cdbRemoveDB(cdb), throws_error(
        "^.*cdb\\$removeDBName does not exist"
        ))
})
