\name{cdbUpdateDoc}
\Rdversion{1.1}
\alias{cdbUpdateDoc}

\title{
This function  updates an existing doc. This
essentially means that a revision, corresponding to the '_id'
has to be provided (in what way ever).
}
\description{
Updating a doc at couchdb means executing a http "PUT" request. The  \code{cdb}
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
the cdb connection configuration list must contain the \code{cdb$serverName},
  \code{cdb$port},  \code{cdb$DBName} and  \code{cdb$id}. The data which
  updates the data stored in the doc is provided in \code{cdb$dataList}
}
}
\details{
  \code{getURLContent()} with \code{customrequest = "PUT"} does the work.

}
\value{
  \item{cdb }{The result of the request is stored in \code{cdb$res} after
    converting the answer by means of  \code{fromJSON()}. If a needed
    \code{cdb$} list entry is not provided \code{cdb$error} maybe says
    something about the R  side.
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

cdb$dataList <- list(a=1:10, b=11:20,d=21:30)

cdb <- cdbAddDoc(cdb)
if(cdb$error == ""){
cdb$rev <- cdb$res$rev
cdb <- cdbUpdateDoc( cdb )
}
}
\keyword{ misc }

