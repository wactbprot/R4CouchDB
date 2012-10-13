\name{cdbDeleteDoc}
\alias{cdbDeleteDoc}
\title{Deletes a document from a database}
\usage{
  cdbDeleteDoc(cdb)
}
\arguments{
  \item{cdb}{Beside \code{cdb$serverName}, \code{cdb$port}
  and \code{cdb$DBName} the \code{cdb$id} must be given. R
  errors are reported in \code{cdb$errors}}
}
\value{
  \item{cdb }{The result of the delete request is stored in
  \code{cdb$res}(whatever this means).  }
}
\description{
  With a given \code{cdb$id} this function sends a http
  \code{"DELETE"} request to the url
  \code{.../cdb$id?rev=cdb$rev}.
}
\author{
  wactbprot
}
\references{
  \url{ http://couchdb.apache.org/ } \url{
  http://www.omegahat.org/ }
}
\seealso{
  \code{cdbAddDoc()}
}
\keyword{misc}

