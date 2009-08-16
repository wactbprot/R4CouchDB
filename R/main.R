source("/home/tg/eig/couchdb/R4CouchDB/R/couchIni.R")

## I'm lazy so lets make a copy to a shorter name
cc <- couchConConv

cc$newDatabaseName <- "db4r"#!! #cc$res[1]

cc <- listDatabases(cc)


j <- match( cc$newDatabaseName, cc$res, nomatch=0)

if(j==0){
  cc <- makeDatabase( cc )
  cc$databaseName <- cc$newDatabaseName

} else{
  cc$databaseName <- cc$newDatabaseName
}

## lets add a doc; why not the cc
cc$jsonStruct <- cc
## cc contains in cc$jsonStruct the cc list now
cc <- addDoc(cc)

## getting the doc back from couch
## and placing the result to cc
cc <- getDoc(cc)$res

cc$'_rev' # is the revition I need 4 the update function
