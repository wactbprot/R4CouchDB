\name{cdbAddDoc}
\alias{cdbAddDoc}
\title{Generates a new document}
\usage{
  cdbAddDoc(cdb)
}
\arguments{
  \item{cdb}{The list \code{cdb} only has to contain a
  \code{cdb$dataList} which is not an empty \code{list()}.}
}
\value{
  \item{cdb}{The couchdb response is stored in
  \code{cdb$res} }
}
\description{
  This function adds a new document to an already existing
  database
}
\details{
  This function is called addDoc (which means add a new
  document). Therefore the \code{cdb$id} is requested using
  \code{cdbGetUuid()} for every document to add if no
  \code{cdb$id} is provided. If a \code{cdb$id} is provided
  the function fails when a document with the given id
  already exists. In this case one should use
  \code{cdbUpdateDoc()}. Since version v0.6 the function
  writes the \code{_rev} and \code{_id} key to the top
  level of \code{cdb$dataList}.
}
\examples{
\dontrun{
ccc               <- cdbIni()
# I assume a database at localhost:5984 already exists
ccc$DBName        <- "r4couchdb_db"
ccc$dataList      <- list(normalDistRand =  rnorm(20))
ccc               <- cdbAddDoc(ccc)

}
}
\author{
  wactbprot
}
\seealso{
  \code{cdbGetDoc()}
}
\keyword{misc}

