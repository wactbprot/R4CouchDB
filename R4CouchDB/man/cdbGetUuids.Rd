\name{cdbGetUuids}
\Rdversion{1.1}
\alias{cdbGetUuids}

\title{
Function for id generation
}
\description{
Function returns a 128bit uuid requested from CouchDB
}

\arguments{
   \item{cdb}{ Only the  connection settings \code{cdb$port} and
     \code{cdb$serverName} is needed.
}
}
\details{
Simple CouchDB API end point to http://serverName:port/_uuids. The
   number N of ids received from a CouchDB can be increased by
   \code{cdb$queryParam <- paste("count=", N, sep="")}.
   For the moment the functions using ids can handle only N=1!
}
\value{

  \item{cdb }{The result of the request is stored in \code{cdb$id} after
    converting the answer into a list using \code{fromJSON()}.
  }
}
\references{

  \url{  http://www.omegahat.org/RCurl/        }
  \url{  http://www.omegahat.org/RJSONIO/      }
  \url{  http://couchdb.apache.org/            }

}
\author{
  wact.b.prot
  thsteinbock@web.de
}

\seealso{
\code{cdbMakeDB}
}
\keyword{ misc }

