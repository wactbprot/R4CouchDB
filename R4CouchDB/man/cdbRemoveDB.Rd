\name{cdbRemoveDB}
\Rdversion{1.1}
\alias{cdbRemoveDB}

\title{
Function removes a database
}
\description{
Removing a database means sending a http "DELETE" request.
}
\usage{
cdbRemoveDB(cdb)
}

\arguments{

  \item{cdb}{The \code{cdb} have to provide \code{cdb$serverName},
  \code{cdb$port} and  \code{cdb$DBName}
}

}

\details{
  In \code{cdb} maybe a entry \code{cdb$delDBName} should be provided
  for more explicit deleting respectively more secure removing.
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
  wact.b.prot
  thsteinbock@web.de
  }

  \seealso{
\code{cdbMakeDB}
}
\examples{
cdb <- cdbIni()

cdb$newDBName <- "db5r"#!! #cdb$res[1]

cdb <- cdbListDB(cdb)

j <- match( cdb$newDBName, cdb$res, nomatch=0)

if( j == 0 ){

  cdb <- cdbMakeDB( cdb )
  cdb$DBName <- cdb$newDBName

} else{

  cdb$DBName <- cdb$newDBName
  cdb$newDBName <- ""

}

cdbListDB(cdb)$res

## GTFO:
cdbRemoveDB(cdb)


}
\keyword{ misc }
