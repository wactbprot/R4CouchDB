#'
#' R4CouchDB twitter example
#' 
#' @author wactbprot
#'
#' example queries some search
#' results from the twitter api
#' and store them  in a database 
#' 
library(RCurl)
library(RJSONIO)

srcPath  <- "../R4CouchDB/R/"
fn       <- list.files(srcPath, pattern="R$")
for (k in 1:length(fn)){
  source(paste(srcPath, fn[k], sep=""))
}

#' search for:
q              <- "japan"
#' generate connection list
foo            <- cdbIni()
#' paste a db name
foo$newDBName  <- paste("twitter_",
                        q,
                        "_db",
                        sep="")
#' build the db and use it
foo$DBName     <- foo$newDBName
foo            <- cdbMakeDB(foo)

#' get 100 search results (per page, rpp)
#' in json format
u              <- paste("http://search.twitter.com/search.json?rpp=100&q=",
                        q,
                        sep="")
#' convert the results to a list
res            <- foo$fromJSON(getURLContent(u))
#' loop over resultset and push it into
#' the db
for(i in 1:length(res$results)){
  foo$dataList <- res$results[[i]]
  print( cdbAddDoc(foo)$res$ok )
}

## lapply(res$results,
##        function(i){
##          foo$dataList <- i
##          cdbAddDoc(foo)$res
##        })

