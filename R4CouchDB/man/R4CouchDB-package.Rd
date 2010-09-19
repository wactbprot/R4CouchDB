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
All functions belonging to this package are written in R.
Every \code{cdbFunction()} gets and emits a list containing the connection
set up.
This \code{list()} is called \code{cdb} in the source files. The result
of each requests, the CouchDB answers, are stored in the
\code{cdb$res}.

The function \code{cdbIni()} initially provides
a basic \code{cdb} list. The two basic \code{cdb} settings  set by
\code{cdbIni()} are  \code{cdb$prot <- "http"} and
\code{cdb$port <- "5984"}. Moreover it is simple to change this defaults direct
in the source code of \code{cdbIni()} and rebuild the package using
\code{R CMD check R4CouchDB} followed by a \code{build} and \code{INSTALL}.
(see "Appendix B Invoking R" of  "An Introduction to R" at
\url{http://www.r-project.org}).

Since
it was not possible to provide a meaningful default \code{cdb$serverName}
for all example sections, this sectionswere removed in the past. Sine
the \url{http://couchone.com}  site starts I can provide:\cr
\code{cdb$serverName <- "wactbprot.couchone.com"}\cr

A test run of most of the fuctions is provided in the example
folder. There are also some comments.

The http connection and the json transformations are done with Duncan
Temple Langs RCurl and RJSON where this package depends on.
Many thanks to him.
}
\author{
wactbprot

Maintainer: thsteinbock@web.de
}
\references{
  \url{  http://r-project.org/}
  \url{  http://www.omegahat.org/RCurl/}
  \url{  http://www.omegahat.org/RJSONIO/}
  \url{  http://couchdb.apache.org/}
  \url{  http://couch.io/}

}
\keyword{ package }
