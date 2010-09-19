\name{cdbMakeDB}
\Rdversion{1.1}
\alias{cdbMakeDB}

\title{
Creates a new database
}
\description{
  The name of the new database is taken from \code{cdb$newDBName}.
}
\usage{
cdbMakeDB(cdb)
}

\arguments{
  \item{cdb}{The \code{cdb} have to provide \code{cdb$serverName},
  \code{cdb$port} and  \code{cdb$newDBName}
}
}
\details{
The work is done by \code{getURLContent()}. After creating the new database
the function makes the shortcut \code{cdb$DBName <- cdb$newDBName} so that further
operations happen on the new created database.
}
\value{
  \item{cdb}{The CouchDB answer is stored in \code{cdb$res}. Any
  problems on the R side are reportet in \code{cdb$error}
}
}
\references{
\url{  http://couchdb.apache.org/       }
}
\author{
  wactbprot
}
\examples{
ccc <- cdbIni()

ccc$serverName <- "wactbprot.couchone.com"
ccc$newDBName <- paste("r4couchdb",cdbGetUuid(ccc)$id, sep="_")
ccc$removeDBName  <- ccc$newDBName

ccc <- cdbMakeDB(ccc)
ccc <- cdbRemoveDB(ccc)

}
\note{
The convention for database naming should be implemented.
}

\seealso{
\code{cdbUpdateDoc}
}
\keyword{ misc }
