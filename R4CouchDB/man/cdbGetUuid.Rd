\name{cdbGetUuid}
\alias{cdbGetUuid}
\title{Function for request one id}
\usage{
  cdbGetUuid(cdb)
}
\arguments{
  \item{cdb}{Only the connection settings \code{cdb$port}
  and \code{cdb$serverName} is needed.}
}
\value{
  \item{cdb }{The result of the request is stored in
  \code{cdb$id} after converting the answer into a list
  using \code{fromJSON()}.}
}
\description{
  Function returns a 128bit uuid requested from CouchDB
}
\details{
  Simple CouchDB API end point to
  http://serverName:port/_uuids.
}
\examples{
\dontrun{
cdbGetUuid(cdbIni())$res
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

