\name{R4CouchDB-package}
\Rdversion{1.1}
\alias{R4CouchDB-package}
\alias{R4CouchDB}
\docType{package}
\title{
Collection of R functions for CouchDB access
}
\description{The R4CouchDB package provides a collection of functions for
basic database and document management operations such as add and
delete.
}
\details{
\tabular{ll}{
Package: \tab R4CouchDB\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2009-08-29\cr
License: \tab BSD\cr
LazyLoad: \tab yes\cr
}
Every \code{cdbFunction()} gets and emits a list containing the connection
set up. Internally this \code{list()} is called \code{cdb}. The result
of  requests, the CouchDB answers are stored in the
\code{cdb$res}.

The function \code{cdbIni()} initially provides
\code{cdb}. However \code{a <- list(serverName="localhost",
  port="5984")} is sufficient for calling \code{cdbGetUuids(a)}.

Since
it was not possible to provide a meaningful default \code{cdb$serverName}
all example sections were removed in the past. Sine the couch.io site
starts a pre alpha testing phase I can provide:\cr
\code{cdb$serverName <- "wactbprot.couchone.com"}\cr
This means the following:
...

The http connection and the json transformations are done with Duncan
Temple Langs RCurl and RJSON where this package depends on.
}
\author{
wact.b.prot

Maintainer: thsteinbock@web.de
}
\references{
\url{  http://www.omegahat.org/RCurl/}
\url{  http://www.omegahat.org/RJSONIO/}
\url{  http://couchdb.apache.org/}
}
\keyword{ package }
