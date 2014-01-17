\name{cdbGetConfig}
\alias{cdbGetConfig}
\title{Request couchdb config}
\usage{
  cdbGetConfig(cdb)
}
\arguments{
  \item{cdb}{Only the connection settings \code{cdb$port}
  and \code{cdb$serverName} is needed.}
}
\value{
  \item{cdb }{The result of the request is stored in
  \code{cdb$re} after converting the answer into a list
  using \code{fromJSON()}.  }
}
\description{
  Function provides access to the \code{_config} api end
  point
}
\examples{
\dontrun{
cdbGetConfig(cdbIni())$res
}
}
\author{
  wactbprot
}
\references{
  \url{ http://www.omegahat.org/RCurl/ } \url{
  http://www.omegahat.org/RJSONIO/ } \url{
  http://couchdb.apache.org/ }
}
\seealso{
  \code{cdbMakeDB}
}
\keyword{misc}

