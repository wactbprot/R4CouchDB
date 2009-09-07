\name{cdbDeleteDoc}
\Rdversion{1.1}
\alias{cdbDeleteDoc}

\title{
Delete a doc from CouchDB
}
\description{
  With a given \code{cdb$id} this function requests the document.
}
\usage{
cdbDeleteDoc(cdb)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cdb}{Beside \code{cdb$serverName}, \code{cdb$port} and
    \code{cdb$DBName} the \code{cdb$id} must be given. R errors are
    reported

    in cdb$errors
}
}
\value{

  \item{cdb }{The result of the delete request is stored in
    \code{cdb$res}.
  }
  }
\references{

\url{  http://couchdb.apache.org/            }
\url{  http://www.omegahat.org/  }

}
\author{
  wact.b.prot
  thsteinbock@web.de
}

\seealso{
\code{cdbAddDoc()}
}
\examples{
cdb <- cdbIni()

cdb <- cdbAddDoc(cdb)
cdb$id
cdbDeleteDoc( cdb )

}
\keyword{ misc }

