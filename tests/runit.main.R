library(RUnit)

testSuite.cdb <- defineTestSuite(
                                 "cdb",
                                 dirs="../R4CouchDB/R/"
                                 w)
testResults <- runTestSuite(
                            testSuite.cdb
                            )
printHTMLProtocol(testResults,
                  fileName="../log/cdb.html")
