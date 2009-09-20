test.cdbMakeDB <- function(){
  ccc <- cdbIni()
  ccc$serverName <- "localhost"
  ccc$DBName <- "runit_test_db"

  checkException(cdbMakeDB(ccc))
  checkException(cdbMakeDB(ccc))
  checkException(cdbMakeDB(ccc))

}
