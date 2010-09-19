\name{cdbGetView}
\Rdversion{1.1}
\alias{cdbGetView}

\title{
Receive view results from CouchDB
}
\description{
The function provides accesses to CouchDB views.
}
\usage{
cdbGetView(cdb)
}

\arguments{
  \item{cdb}{ Beside the connection details
  (\code{cdb$port},\code{cdb$DAName} ...) the \code{cdb$design} and
  \code{cdb$view} is needed.

}
}
\details{
Query params e.g. \code{"reduce=false"} or  \code{"group_level=1"} can
be provided in \code{cdb$queryParam}
}
\value{

  \item{cdb }{The result of the request is stored in cdb$res after
    converting the json answer into a list using fromJSON(). If a needed
    cdb list entry was not provided cdb$error says something about the R
    side

    }
}
\references{

\url{  http://www.omegahat.org/RCurl/        }
\url{  http://www.omegahat.org/RJSONIO/      }
\url{  http://couchdb.apache.org/            }
\url{  http://www.omegahat.org/RJavaScript/  }
}
\author{
  wactbprot
}
\examples{
ccc <- cdbIni()
ccc$serverName <- "wactbprot.couchone.com"
ccc$DBName <- "r4couchdb"
ccc$design <- "r4" ## a simple already saved view
ccc$view <- "couchdb"
cdbGetView(ccc)$res
}
\note{
For the moment only one \code{cdb$queryParam} is possible. In the future
maybe Duncans \code{RJavaScript} package can be used to generate views
without leaving R.
}
\keyword{ misc }
