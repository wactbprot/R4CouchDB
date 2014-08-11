```
         __ _  _     ___                 _        ___  ___ 
        /__\ || |   / __\___  _   _  ___| |__    /   \/ __\
       / \// || |_ / /  / _ \| | | |/ __| '_ \  / /\ /__\//
      / _  \__   _/ /__| (_) | |_| | (__| | | |/ /_// \/  \
      \/ \_/  |_| \____/\___/ \__,_|\___|_| |_/___,'\_____/
```

## A Collection of R functions for CouchDB access

The R4CouchDB package provides a collection of functions for
basic database and document management operations such as add and
delete.

**Note:** Check out [*sofa*](https://github.com/SChamberlain/sofa), from
@recology_  another R package to interact with CouchDB.

## Literature

The R4CouchDB package is reviewed in the book 
[_XML and Web Technologies for Data Sciences with R_](http://www.springer.com/statistics/computational+statistics/book/978-1-4614-7899-7) 
by Deborah Nolan and Duncan Temple Lang published in 2014 on _Springer_.

## Overview

Every ```cdbFunction()``` gets and returns a ```list()``` containing the
complete connection set up and the data. With the command 

```
R> cdb <- cdbIni()
``` 

such a ```list()``` can be generated. It contains some default values e.g.
the 
```
R> cdb$serverName
R> [1] "localhost"
```
or
```
R> cdb$digits
R> [1] 7
```
With a database running on  [http://localhost:5984](http://localhost:5984)
the R-command:
```
R> cdbListDB( cdbIni() )
```

lists the databases.


## Getting started

* R4CouchDB is is available over
  [http://cran.r-project.org](http://cran.r-project.org/web/packages/R4CouchDB/index.html). This
  means that one can use the R command

```
R> install.packages("R4CouchDB")
```

 be aware of the fact that beside ```R-base-devel``` must be installed RCurl needs ```libcurl-devel```.
 The package name may differ e.g.: **openSuse** people say ```zypper in libcurl-devel```
 **ubuntu** useRs run ```sudo apt-get install libcurl4-openssl-dev ```

* an further way for those who have _devtools_ installed is
```
R> library(devtools)
R> install_github('R4CouchDB', 'wactbprot', subdir = 'R4CouchDB')
```
  (see e.g. http://www.inside-r.org/packages/cran/devtools/docs/install_github)

* open R shell and load library with:
```
R> library(R4CouchDB)
```
* generate a connection object (a simple ```list()```) with:
```
R> foo <- cdbIni()
```
* play around with ```foo```
```
R> foo$queryParam <- "count=10"
R> cdbGetUuidS(foo)$res
```
* see test session in the example folder

* get angry and write a [issue](https://github.com/wactbprot/R4CouchDB/issues)

## Tests

Since version 0.6 a test session is available. The functions below the
folder ```tests``` in the files ```test/test*.r``` assume a writable _CouchDB_
instance running on [http://localhost:5984](http://localhost:5984).
Run the tests e.g. with:

```
$> cd R4CouchDB/tests 
$> R -f run.r
```

## Problems
### untar

If you get somenthing like this:
```
$> untar2(tarfile, files, list, exdir) : unsupported entry type ‘x’
```
on installation you can try
```
$> export R_INSTALL_TAR=tar
```
and than
```
$> R CMD INSTALL R4CouchDB_latest_
```
### \r

In the function ```cdbIni()``` I added with 0.1.2 the lines:
```
       cdb$toJSON <- function(lst){
         jsn <- toJSON(lst,
			    collapse = "",
				digits = digits)
         jsn <- gsub("\\r","\\\\r",jsn)
         return(jsn)
       }
```
The point is: one can have a
```
       {"a":"\r"}
```
in the database but one can not send it back
this way. A ```\r``` is here replaced by ```\\r```
resulting in ```\r``` in the database.
The ```gsub()``` function behaves like this:

```
R> gsub("\\r","\\\\r","\r")
R> [1] "\\r"
R> gsub("\\r","\\\\r","\\r")
R> [1] "\\r"
R> gsub("\\r","\\\\r","\\\r")
R> [1] "\\\\r"
R> gsub("\\r","\\\\r","\\\\r")
R> [1] "\\\\r"
```
I'm not happy with this but I have no better solution for the moment.


### digits

Numbers are converted to JSON with 7 digits by default.

```
R> cdbIni()$digits
R> [1] 7
```

Adjust this to your needs by:

```
R> cdb        <- cdbIni()
R> cdb$digits <- 13
```
or
```
R>cdb        <- cdbIni(digits=13) 
```
