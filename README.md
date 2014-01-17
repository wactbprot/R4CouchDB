```
         __ _  _     ___                 _        ___  ___ 
        /__\ || |   / __\___  _   _  ___| |__    /   \/ __\
       / \// || |_ / /  / _ \| | | |/ __| '_ \  / /\ /__\//
      / _  \__   _/ /__| (_) | |_| | (__| | | |/ /_// \/  \
      \/ \_/  |_| \____/\___/ \__,_|\___|_| |_/___,'\_____/
```

## A Collection of R functions for CouchDB access

The R4CouchDB package provides a collection of functions for
basic database and document management operations such as add  and
delete.

Every cdbFunction() gets and emits a list containing the
connection set up.
With the cdbIni() function the cdb$serverName is set to
"localhost" as a default.
There are some examples below the demo folder.

**Note:** Check out [*sofa*](https://github.com/SChamberlain/sofa), from
@recology_  another R package to interact with CouchDB.


## Getting started

* R4CouchDB is is available over
  (http://cran.r-project.org/web/packages/R4CouchDB/index.html)[http://cran.r-project.org]. This
  means that one can use the R command

 ```
  > install.packages("R4CouchDB")
```
 (please be aware of the fact that beside ```R-base-devel``` must be installed Rcurl needs ```libcurl-devel```)

* an further way for those who have _devtools_ installed is

         library(devtools)
         install_github('R4CouchDB', 'wactbprot', subdir = 'R4CouchDB')

  (see e.g. http://www.inside-r.org/packages/cran/devtools/docs/install_github)

* open R shell and load library with:

         library(R4CouchDB)

* generate a connection object (list) with:

         foo <- cdbIni()

* play around with _foo_

         foo$queryParam <- "count=10"
         cdbGetUuidS(foo)$res

* or make a twitter_db and fill up some search results from the request
  http://search.twitter.com/search.json?q=couchdb

         foo$newDBName  <- "japan_db"
         foo            <- cdbMakeDB(foo)
         u              <- "http://search.twitter.com/search.json?q=japan&rpp=100&page=10"
         res            <- fromJSON(getURLContent(u))
         lapply(res$results,
                    function(i){
                         foo$dataList <- i
                         cdbAddDoc(foo)$error
                     })


* get angry and write a ticket or mail

## Problems

### untar

If you get somenthing like this:

        untar2(tarfile, files, list, exdir) : unsupported entry type ‘x’

on installation you can try

       export R_INSTALL_TAR=tar

and than

       R CMD INSTALL R4CouchDB_latest_

### \r

In cdbIni I added with 0.1.2 the lines:

       cdb$toJSON <- function(lst){
         jsn <- toJSON(lst, collapse = "")
         jsn <- gsub("\\r","\\\\r",jsn)
         return(jsn)
       }

 The point is: one can have a

       {"a":"\r"}

in the database but one can not send it back
this way. A \r is here replaced by \\r
resulting in \r in the database.
The gsub statement behaves like this:

       > gsub("\\r","\\\\r","\r")
       [1] "\\r"
       > gsub("\\r","\\\\r","\\r")
       [1] "\\r"
       > gsub("\\r","\\\\r","\\\r")
       [1] "\\\\r"
       > gsub("\\r","\\\\r","\\\\r")
       [1] "\\\\r"

I'm not happy
with this but have no better solution for the moment.


