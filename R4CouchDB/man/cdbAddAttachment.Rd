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
  The function uses \code{guessMIMEType()} to do exactly
  this. If the switch \code{cdb$attachmentsWithPath} is set
  to \code{TRUE} the attachments were saved with path.
}
\author{
  wactbprot
}
\keyword{misc}

