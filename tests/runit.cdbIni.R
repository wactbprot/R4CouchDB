test.cdbIni <- function(){


  checkException(cdbIni(2))

  checkEquals(cdbIni()$serverName,"")


}
