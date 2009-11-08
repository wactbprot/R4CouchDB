### Name: cdbGetView
### Title: Receive view results from CouchDB
### Aliases: cdbGetView
### Keywords: misc

### ** Examples

## Not run:
## If:
## function(doc) {
##  emit(null, doc._id);
## }
## is stored under design: test, view: id
## in the database db5r

cdb <- cdbIni()
cdb$DBName <- "db5r"
cdb$design <- "test"
cdb$view <- "id"

## cdbGetView(cdb)$res




