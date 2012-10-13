\name{cdbAddAttachment}
\alias{cdbAddAttachment}
\title{Add attachments}
\usage{
  cdbAddAttachment(cdb)
}
\arguments{
  \item{cdb}{The list \code{cdb} has to contain
  \code{cdb$fileName},\code{cdb$serverName},
  \code{cdb$DBName} and a \code{cdb$id}.}
}
\value{
  \item{cdb}{The result is stored in \code{cdb$res} }
}
\description{
  This function adds attachments to a doc.
}
\details{
  The function uses a simple call to
  \code{strsplit(fileName, ".")} and takes the last entry
  of the resulting vector as the \code{Content-Type} in the
  \code{httpheader}.
}
\author{
  wactbprot
}
\keyword{misc}

