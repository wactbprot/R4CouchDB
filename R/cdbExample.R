source("/home/tg/eig/couchdb/R4CouchDB/R/cdbIni.R")

cdb$newDatabaseName <- "db5r"#!! #cdb$res[1]

cdb <- cdbListDB(cdb)


j <- match( cdb$newDatabaseName, cdb$res, nomatch=0)

if(j==0){

  cdb <- cdbMakeDB( cdb )
  cdb$databaseName <- cdb$newDatabaseName

} else{

  cdb$databaseName <- cdb$newDatabaseName
  cdb$newDatabaseName <- ""
}

## lets add a doc; why not the cdb
## cdb contains in cdb$dataList cdb
## cdb$dataList <- cdb
## _not_ cdb because the resulting structure is not ...
## $res$res  and so on ...
## it seems furthermore that the >id< tag auses
## problems; I can't query >id< in the a tempview
## at futon ...
## ... maybe here bis the source for the
## replication problems...!?

## so simply a list:
cdb$dataList <- list(a=1:10, b=11:20,d=21:30)
## cdb contains in cdb$dataList the cdb list now
cdb <- cdbAddDoc(cdb)

## getting the doc back from couch
## and placing the result to cdb
cdb <- cdbGetDoc(cdb)

## we need the revition for updating the doc
cdb$rev <- cdb$res$'_rev'
cdb <- cdbUpdateDoc( cdb )

## forget the remaining stuff
cdb$res <- ""

## update date
cdb$dataList <- list(a=1:40,
                    e = 31:40)
## update doc
cdb <- cdbUpdateDoc( cdb )

x <- cdb$dataList
save(x, file= cdb$postFile <- cdb$id )



## at least we remove the test CDB
cdb$databaseName
cdb <- cdbRemoveDB(cdb)
