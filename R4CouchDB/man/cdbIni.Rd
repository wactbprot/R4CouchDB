\name{cdbIni}
\alias{cdbIni}
\title{Ini function}
\usage{
  cdbIni(serverName="localhost",port="5984",dbname="")
}
\arguments{
  \item{serverName}{server name}

  \item{port}{port}

  \item{dbname}{name of database}
}
\value{
  \item{cdb}{see details for the default settings of this
  function }
}
\description{
  Function returns a list with some default settings and
  often used functions such as \code{cdb$baseUrl}.
}
\details{
  The list: \code{ cdb <- list(serverName = "localhost",
  ... )} is returned if the packages \code{library(RCurl)}
  and \code{library(RJSONIO)} are successfully loaded.
}
\author{
  wactbprot
}
\keyword{misc}

