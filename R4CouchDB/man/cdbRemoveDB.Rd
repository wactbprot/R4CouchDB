\name{cdbRemoveDB}
\Rdversion{1.1}
\alias{cdbRemoveDB}

\title{
Function to remove a database.
}
\description{
Removing a database means sending a http- "DELETE"- request to
\code{http://cdb$serverName:cdb$port/ ...}
}
\usage{
cdbRemoveDB(cdb)
}

\arguments{

  \item{cdb}{The \code{cdb} has to provide \code{cdb$serverName},
  \code{cdb$port} and  \code{cdb$DBName}
}

}

\details{
  In \code{cdb} maybe a entry \code{cdb$delDBName} should be provided
  for more explicit deleting respectively more secure removing.
  }
  \value{
     \item{cdb}{The CouchDB answer is stored in \code{cdb$res}. Any
  problems on the R side are reportet in \code{cdb$error}
}
}
\references{
\url{  http://couchdb.apache.org/       }
}
\author{
  wact.b.prot
  thsteinbock@web.de
  }

  \seealso{
\code{cdbMakeDB}
}

\keyword{ misc }
