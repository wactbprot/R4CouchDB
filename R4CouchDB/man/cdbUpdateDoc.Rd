\name{cdbUpdateDoc}
\Rdversion{1.1}
\alias{cdbUpdateDoc}

\title{
cdbUpdateDoc update an existing doc at an existing CouchDB.
}
\description{
Updating a doc at couchdb means executing a http "PUT" request. The cdb
list must contain the \code{cdb$serverName}, \code{cdb$port},
    \code{cdb$DBName}, \code{cdb$id}. If
the \code{cdb$rev} is not given the function uses \code{cdbGetDoc()} to receive the
latest revision number.
}
\usage{
cdbUpdateDoc(cdb)
}

\arguments{
  \item{cdb}{
the cdb connection config list must contain the \code{cdb$serverName},
  \code{cdb$port},  \code{cdb$DBName} and  \code{cdb$id}. The data which
  updates the data stored in the doc is provided in \code{cdb$dataList}
}
}
\details{
  getURLContent() with customrequest = "PUT" makes the work.

}
\value{
  \item{cdb }{The result of the request is stored in cdb$res after
    converting the json answer into a list using fromJSON(). If a needed
    cdb list entry was not provided cdb$error says somthing about the R
    side
  }


}
\references{
\url{  http://www.omegahat.org/RCurl/   }
\url{  http://www.omegahat.org/RJSONIO/ }
\url{  http://couchdb.apache.org/       }

}
\author{
  wact.b.prot
  thsteinbock@web.de
}
\note{

}



\seealso{
\code{cdbInit()}
}
\examples{
cdb <- cdbIni()
cdb$newDBName <- "db5r"#!! #cdb$res[1]

  cdb <- cdbMakeDB( cdb )
  cdb$DBName <- cdb$newDBName
cdb$dataList <- list(a=1:10, b=11:20,d=21:30)


cdb <- cdbAddDoc(cdb)

cdb$rev <- cdb$res$'_rev'
cdb <- cdbUpdateDoc( cdb )

}
\keyword{ misc }

