```
         __ _  _     ___                 _        ___  ___ 
        /__\ || |   / __\___  _   _  ___| |__    /   \/ __\
       / \// || |_ / /  / _ \| | | |/ __| '_ \  / /\ /__\//
      / _  \__   _/ /__| (_) | |_| | (__| | | |/ /_// \/  \
      \/ \_/  |_| \____/\___/ \__,_|\___|_| |_/___,'\_____/
```

## A Collection of R functions for CouchDB access

The R4CouchDB package provides a collection of functions for
basic database and document management operations such as add, get and
delete.

**Note:** Check out [*sofa*](https://github.com/SChamberlain/sofa), from
@recology_  another R package to interact with CouchDB.

**Note:** I added a example of
  [R4CouchDB usage to the (new) CouchDB wiki](https://cwiki.apache.org/confluence/display/COUCHDB/R)
  
## Literature

The R4CouchDB package is reviewed in the book 
[_XML and Web Technologies for Data Sciences with R_](http://www.springer.com/statistics/computational+statistics/book/978-1-4614-7899-7) 
by Deborah Nolan and Duncan Temple Lang published in 2014 on _Springer_.

## Credits

* Thanks to [@parisni](https://github.com/parisni) for the contribution of ```cdbAddDocS()``` 

## Overview

Every ```cdbFunction()``` gets and returns a ```list()``` containing the
complete connection setup  and the data. With the command 

```
R> conn <- cdbIni()
``` 

such a ```list()``` can be generated. It contains some default values e.g.
the 
```
R> conn$serverName
R> [1] "localhost"
```
or
```
R> conn$digits
R> [1] 7
```
With a database running at  [http://localhost:5984](http://localhost:5984)
the R-command:
```
R> cdbListDB( cdbIni() )
```

lists the databases available at  [localhost](http://localhost:5984).


## Getting started

* R4CouchDB can be installed from
  [http://cran.r-project.org](http://cran.r-project.org/web/packages/R4CouchDB/index.html):

```
R> install.packages("R4CouchDB")
```
```
R> library(R4CouchDB)
```
* generate a connection object (a simple ```list()```) with:
```
R> conn <- cdbIni()
```
* play around with ```conn```
```
R> conn$queryParam <- "count=10"
R> cdbGetUuidS(conn)$res
```

* see test session in the example folder
* write a [issue](https://github.com/wactbprot/R4CouchDB/issues)

## Tests

The functions in the
```tests``` folder assume a writable _CouchDB_ instance running on [http://localhost:5984](http://localhost:5984):

```
$> cd R4CouchDB/tests 
$> R -f run.r
```
