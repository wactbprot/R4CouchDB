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
  \code{cdb$id} is requested fresh for every document to add.
}

\value{
 \item{cdb}{The result is stored in \code{cdb$res}
}
}
\author{
  wact.b.prot
  thsteinbock@web.de

}
\seealso{
\code{cdbGetDoc()}
}

\keyword{ misc }

