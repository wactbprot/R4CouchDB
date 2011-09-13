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

\details{
  The list:
  \code{     cdb <- list(serverName = "localhost", ... )}
 is returned if the packages \code{library(RCurl)} and
\code{library(RJSONIO)} are successfully loaded.
}
\value{

  \item{cdb}{see details for the default settings of this function
}
}
\author{
  wactbprot
}
\keyword{ misc }

