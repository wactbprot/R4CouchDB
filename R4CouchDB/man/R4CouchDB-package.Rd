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

The Rd-examples in this package are a kind of fake. Every
function tests the needed list entries before request execution. Since
it is not possible to provide a default \code{cdb$serverName} all
function calls in the example- sections set a \code{cdb$error <- "no
  cdb$serverName"}, no http- request is executed.

  The http connection and the json transformations are done with Duncan
Temple Langs RCurl and RJSON.
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
\seealso{
}
\examples{
## get the list structure
cdb <- cdbIni()
## this structure includes:
cdb
## the command
cdb <- cdbListDB(cdb)
## yields
cdb$error
}
