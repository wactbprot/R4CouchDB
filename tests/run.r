source("load.r")

test_file("testIni.r")

cdb  <- cdbIni()

test_file("testMakeDB.r")

test_file("testAddDoc.r")

test_file("testUpdateDoc.r")

test_file("testGetDoc.r")

test_file("testRemoveDB.r")

