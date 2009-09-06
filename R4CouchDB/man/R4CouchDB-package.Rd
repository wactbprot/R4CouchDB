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
set up. The result of the request is stored in the \code{lists$res} This list is initialy provided using the cdbIni() function.
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
## get the default setup
cdb <- cdbIni()
## it includes:
cdb
cdb <- cdbListDB(cdb)
## localhost contains the following DB(s)
cdb$res
}
