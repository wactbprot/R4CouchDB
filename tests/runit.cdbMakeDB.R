test.cdbMakeDB <- function(){
  ccc <- cdbIni()
  ccc$serverName <- "localhost"
  ccc$DBName <- "runit_test_db"

  checkTrue(cdbRemoveDB(ccc)$error != "")

}
