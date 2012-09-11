\name{cdbAddDoc}
\Rdversion{1.1}
\alias{cdbAddDoc}

\title{
Generates a new document
}
\description{
  This function adds a new document to an already existing database

}
\usage{
cdbAddDoc(cdb)
}

\arguments{
  \item{cdb}{The list \code{cdb} only has to contain a
  \code{cdb$dataList} which is not an empty \code{list()}.
}
}
\details{
This function is called addDoc (which means add a new
 document). Therefore the
 \code{cdb$id} is requested using \code{cdbGetUuid()} for every document
  to add if no \code{cdb$id} is provided. If a \code{cdb$id} is provided
  the function fails when a document with the given id already
  exists. In this case one should use  \code{cdbUpdateDoc()}.
Since version v0.6 the function writes the \code{_rev} and \code{_id}
  key to the top level of \code{cdb$dataList}.
}

\value{
 \item{cdb}{The couchdb response is stored in \code{cdb$res}
}
}
\author{
  wactbprot
}
\seealso{
\code{cdbGetDoc()}
}

\keyword{ misc }

