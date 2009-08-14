source("/home/tg/eig/couchdb/R4CouchDB/couchIni.R")

cc <- listDatabases(couchConConv)

cc$newDatabaseName <- "db4r"#!! #cc$res[1]

cc$databaseName <- cc$res[1]



cc <- makeDatabase(cc)
