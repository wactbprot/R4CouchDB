\name{cdbGetList}
\Rdversion{1.1}
\alias{cdbGetList}

\title{
Receive list results from CouchDB
}
\description{
The function provides accesses to CouchDB lists.
}
\usage{
cdbGetList(cdb)
}

\arguments{
  \item{cdb}{ Beside the connection details
  (\code{cdb$port},\code{cdb$DAName} ...) the \code{cdb$design}
  \code{cdb$view} and \code{cdb$list} is needed.

}
}
\details{
Query params e.g. \code{"reduce=false"} or  \code{"group_level=1"} can
be provided in \code{cdb$queryParam}
By now multible params must be given in one string e.g.  \code{"a=b&c=d&e=f"}.

}
\value{

  \item{cdb }{The result of the request is stored in cdb$res after
    converting the json answer into a list using fromJSON(). If a needed
    cdb (design, list, view, ...) entry was not provided cdb$error
    says something about the R  side.

    }
}
\references{
\url{  http://www.omegahat.org/RCurl }
\url{  http://www.omegahat.org/RJSONIO }
\url{  http://couchdb.apache.org            }
\url{  http://www.omegahat.org/RJavaScript  }
}
\author{
  wactbprot
}

\keyword{ misc }
