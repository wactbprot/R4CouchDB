source("load.r")

test_file("testIni.r")

cdb  <- cdbIni()
dbs  <- unlist(cdbListDB(cdb)$res)
i    <- which(dbs %in% c(testConsts$db))

## make db if not exist
if(length(i) == 0){
    print(paste( "make test db under",cdb$serverName, "named", testConsts$db)) 
    cdb$newDBName <- testConsts$db
    cdbMakeDB(cdb)$res
}

cdb$id       <- testConsts$id
cdb$DBName   <- testConsts$db
cdb$dataList <- testConsts$data
cdb          <- cdbUpdateDoc(cdb)

test_file("testGetDoc.r")
