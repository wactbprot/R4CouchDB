##

source("/home/tg/eig/couchdb/R4CouchDB/R/couchIni.R")

## I'm lazy so lets make a copy to a shorter name
cc <- couchConConv

cc$newDatabaseName <- "db4r"#!! #cc$res[1]

cc <- listDatabases(cc)


j <- match( cc$newDatabaseName, cc$res, nomatch=0)

if(j==0){
  cc <- makeDatabase( cc )
  cc$databaseName <- cc$newDatabaseName

} else{getDoc(cc)

  cc$databaseName <- cc$newDatabaseName
}

## lets add a doc; why not the cc
## cc contains in cc$dataList cc
## cc$dataList <- cc
## _not_ cc because the resulting structure is not ...
## $res$res  and so on ...
## it seems furthermore that the >id< tag auses
## problems; I can't query >id< in the a tempview
## at futon ...
## ... maybe here bis the source for the
## replication problems...!?

## so simply a list:
cc$dataList <- list(a=1:10, b=11:20,d=21:30)
## cc contains in cc$dataList the cc list now
cc <- addDoc(cc)

## getting the doc back from couch
## and placing the result to cc
cc <- getDoc(cc)

## we need the revition for updating the doc
cc$rev <- cc$res$'_rev'

## forget the remaining stuff
cc$res <- ""

cc$dataList <- list(a=1:40,
                    e = 31:40)

cc <- updateDoc( cc )

