% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/cdbGetConfig.R
\name{cdbGetConfig}
\alias{cdbGetConfig}
\title{Request couchdb config}
\usage{
cdbGetConfig(cdb)
}
\arguments{
\item{cdb}{Only the connection settings \code{cdb$port} and
\code{cdb$serverName} is needed.}
}
\value{
\item{cdb }{The result of the request is stored in \code{cdb$res} after
converting the answer into a list using \code{fromJSON()}.}
}
\description{
Function provides access to the \code{_config} api end point.
}
\examples{
\dontrun{
cdbGetConfig(cdbIni())$res
}
}
\author{
wactbprot
}
\seealso{
\code{cdbMakeDB}
}
\keyword{misc}

