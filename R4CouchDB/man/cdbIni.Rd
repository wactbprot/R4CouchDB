\name{cdbIni}
\Rdversion{1.1}
\alias{cdbIni}

\title{
Ini function
}
\description{
Function returns a list with some default settings
}
\usage{
cdbIni(serverName="localhost",port="5984",dbname="")
}
\arguments{
  \item{serverName}{The servername as it fits in the scheme
    \code{http://serverName:port/dbname/...} (optional)}
  \item{port}{The port as it fits in the scheme
    \code{http://serverName:port/dbname/...}(optional)}
  \item{dbname}{The database name as it fits in the scheme
    \code{http://serverName:port/dbname/...}(optional)} 

}
\details{
  The list:
  \code{cdb <- list(serverName = "localhost", ... )}
 is returned if the packages \code{library(RCurl)} and
\code{library(RJSONIO)} are successfully loaded.
}
\value{
  \item{cdb}{A conection object (a list) is returned.}
}
\author{
  wactbprot
}
\keyword{ misc }

