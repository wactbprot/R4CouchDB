\name{cdbAddAttachment}
\Rdversion{1.1}
\alias{cdbAddAttachment}

\title{
Add Attachments
}
\description{
  This function adds attachments to a doc

}
\usage{
cdbAddAttachment(cdb)
}

\arguments{
  \item{cdb}{The list \code{cdb}  has to contain
  \code{cdb$fileName},\code{cdb$serverName}, \code{cdb$DBName} and a \code{cdb$id}.
}
}
\details{
The function uses a simple call to \code{strsplit(fileName, ".")} and
takes the last entry of the resulting vector as the \code{Content-Type} in
the \code{httpheader}.
}

\value{
 \item{cdb}{The result is stored in \code{cdb$res}
}
}
\author{
  wactbprot
  thsteinbock@web.de

}

\examples{
cdb <- cdbIni()
cdb$serverName <- "wactbprot.couchone.com"
cdb$DBName <- "r4couchdb"
cdb$fileName <- paste("../",cdb$DBName,".test.png", sep="")

## make a png (stolen from ?persp)
png(filename=cdb$fileName)
x <- seq(-10, 10, length= 30)
      y <- x
      f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
      z <- outer(x, y, f)
      z[is.na(z)] <- 1
      op <- par(bg = "white")
      persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue")
dev.off()

}
\keyword{ misc }

