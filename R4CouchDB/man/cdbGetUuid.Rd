\name{cdbGetUuid}
\Rdversion{1.1}
\alias{cdbGetUuid}

\title{
Function for request one  id
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
Simple CouchDB API end point to http://serverName:port/_uuids. 
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
  wactbprot
}

\seealso{
\code{cdbMakeDB}
}
\keyword{ misc }

