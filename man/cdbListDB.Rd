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
Simple CouchDB API end point: http://serverName:port/_all_dbs
}
\value{

  \item{cdb }{The result of the request is stored in cdb$res after
    converting the json answer into a list using fromJSON().
}
\references{

  \link{  http://www.omegahat.org/RCurl/        }
  \link{  http://www.omegahat.org/RJSONIO/      }
  \link{  http://couchdb.apache.org/            }

}
\author{
  wact.b.prot
  thsteinbock@web.de
}
\note{

}



\seealso{
\code{cdbMakeDB}
}
\examples{
cdb <- cdbIni()
cdbListDB(cdb)$res
}
\keyword{ misc }

