\name{cdbUpdateDoc}
\Rdversion{1.1}
\alias{cdbUpdateDoc}

\title{
This function  updates an existing doc. This
essentially means that a revision, corresponding to the '_id'
has to be provided. If no '_rev' is provided the function gets the doc
fron the db and takes the revition number for the update 
}
\description{
  Updating a doc at couchdb means executing a http "PUT" request. The  \code{cdb}
  list must contain the \code{cdb$serverName}, \code{cdb$port},
  \code{cdb$DBName}, \code{cdb$id}. Since v0.6 the revision of the
  document should exist at the intended place;
  \code{cdb$dataList$'_rev'}. 
}
\usage{
cdbUpdateDoc(cdb)
}

\arguments{
  \item{cdb}{
    the cdb connection configuration list must contain the \code{cdb$serverName},
  \code{cdb$port},  \code{cdb$DBName} and  \code{cdb$id}. The data which
  updates the data stored in the doc is provided in \code{cdb$dataList}
}
}
\details{
  \code{getURL()} with \code{customrequest = "PUT"} does the work.
  If a needed
  \code{cdb$} list entry is not provided \code{cdb$error} maybe says
  something about the R  side.
}
\value{
  \item{cdb }{The response of the request is stored in \code{cdb$res} after
    converting the answer by means of  \code{fromJSON()}. The revision
    provided by the respons is used for updating the \code{cdb$dataList$'_rev'}.  
  }


}
\references{
\url{  http://www.omegahat.org/RCurl/   }
\url{  http://www.omegahat.org/RJSONIO/ }
\url{  http://couchdb.apache.org/       }

}
\examples{
ccc <- cdbIni()
ccc$serverName <- "wactbprot.couchone.com"
ccc$DBName <- "r4couchdb"
ccc$dataList <- list(normalDistRand =  rnorm(20))
ccc <- cdbAddDoc(ccc)
cdbUpdateDoc(ccc)$res
}
\author{
  wactbprot
}
\seealso{
\code{cdbInit()}
}
\keyword{ misc }
