test.cdbRemoveDB <- function(){
  ccc <- cdbIni()
  ccc$serverName <- "localhost"
  ccc$removeDBName <- "runit_test_db"
  ccc$newDBName <- ccc$removeDBName

  checkTrue(cdbRemoveDB(ccc)$error != "")
  checkTrue(cdbMakeDB(ccc)$error == "" )
  checkTrue(cdbRemoveDB(ccc)$error =="")

}
