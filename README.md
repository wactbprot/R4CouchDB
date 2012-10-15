
          _____   _      )   ___                ______    ______   
         (, /   ) /   / (__/_____)          /) (, /    ) (, /    ) 
           /__ / /___/_   /       ___    _ (/    /    /    /---(   
        ) /   \_    /    /       (_)(_(_(__/ )__/___ /_ ) / ____)  
       (_/         /    (______)             (_/___ /  (_/ (       
                                                                      
      



## A Collection of R functions for CouchDB access

The R4CouchDB package provides a collection of functions for
basic database and document management operations such as add  and
delete. 

Every cdbFunction() gets and emits a list containing the
connection set up.
With the cdbIni() function the cdb$serverName is set to
"localhost" as a default. This means that localhost should
provide a CouchDB. There are some examples below the demo folder.

## Getting started

* download latest version or clone repository
* open a shell and install the package with:
      
         R CMD INSTALL R4CouchDB
  
  dependencies (bitopts, RCurl, RJSONIO) can be 
  installed in the same way

* an easier way for those who have _devtools_ installed is 

         library(devtools)
         install_github('R4CouchDB', 'wactbprot', subdir = 'R4CouchDB')

* open R shell and load library with:

         library(R4CouchDB)

* generate a connection object (list) with:

         foo <- cdbIni()

* play around with _foo_

         foo$queryParam <- "count=10"
         cdbGetUuidS(foo)$res

* or make a twitter_db and fill up some search results from the request
  http://search.twitter.com/search.json?q=couchdb

         foo$newDBName  <- "twitter_db"
         foo            <- cdbMakeDB(foo)
         u              <- "http://search.twitter.com/search.json?q=couchdb"
         res            <- fromJSON(getURLContent(u))
         lapply(res$results,
                    function(i){
                         foo$dataList <- i
                         cdbAddDoc(foo)})
         foo$res

* get angry and write a ticket or mail

## Problems

If you get somenthing like this:

        untar2(tarfile, files, list, exdir) : unsupported entry type ‘x’

on installation you can try

       export R_INSTALL_TAR=tar

and than

       R CMD INSTALL R4CouchDB_latest_

HTH
