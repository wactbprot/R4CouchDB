\name{cdbIni}
\Rdversion{1.1}
\alias{cdbIni}

\title{
Ini function
}
\description{
Function returns a list with some default settings
}
\usage{
cdbIni()
}

\details{
  The list:
  \code{     cdb <- list(
                serverName = "",
                port = "5984",
                DBName="",
                newDBName="",
                id="",
                rev="",
                dataList=list(),
                design="",
                view="",
                queryParam="",
                date=toString( Sys.Date()),
                error="",
                res=""
                )
} is returned if the packages \code{library(RCurl)} and
\code{library(RJSONIO)} are successfully loaded.
}
\value{

  \item{cdb}{see details for the default settings of this function
}
}
\author{

  wact.b.prot
  thsteinbock@web.de
}

\seealso{

}
\examples{
d <- cdbIni()
cdbListDB(d)$res
}
\keyword{ misc }

