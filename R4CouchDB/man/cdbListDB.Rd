\name{cdbListDB}
\Rdversion{1.1}
\alias{cdbListDB}

\title{
Returns all databases
}
\description{
Gives a list of all databases
}
\usage{
cdbListDB(cdb)
}

\arguments{
   \item{cdb}{ Only the  connection settings \code{cdb$port} and
     \code{cdb$serverName} is needed.
}
}
\details{
Simple CouchDB API end point: \url{http://localhost:5984/_all_dbs}
}
\value{

  \item{cdb }{The result of the request is stored in cdb$res after
    converting the json answer into a list using \code{fromJSON()}.
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
