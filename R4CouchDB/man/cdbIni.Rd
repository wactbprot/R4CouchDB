\name{cdbIni}
\alias{cdbIni}
\title{Ini function}
\usage{
  cdbIni(serverName="localhost", port="5984", DBName="",
    prot = "http", uname = "", pwd = "", newDBName = "",
    removeDBName = "", id = "", dataList = list(), fileName
    = "", design = "", view = "", list = "", queryParam =
    "", encSub = "?", attachmentsWithPath=TRUE, digits = 7)
}
\arguments{
  \item{serverName}{server name}

  \item{port}{port}

  \item{DBName}{name of database}

  \item{prot}{name of the protocol default is http}

  \item{uname}{name of the user}

  \item{pwd}{password}

  \item{newDBName}{name of the database for cdbMakeDB()}

  \item{removeDBName}{name of the database to remove with
  cdbRemoveDB()}

  \item{id}{the document id to get, put, post or delete}

  \item{dataList}{a list containing data to post or update}

  \item{fileName}{for use in cdbAddAttachment}

  \item{design}{the name of the design used when asking a
  view or list}

  \item{view}{the name of the view to query}

  \item{list}{the name of the list to query}

  \item{queryParam}{additional query params}

  \item{encSub}{a character which is used as a replacement
  for chars who can not be converted by iconv}

  \item{attachmentsWithPath}{effects the result of the
  function cdbAddAttachment in the way the variable is
  named}

  \item{digits}{digits kept at toJSON conversion}
}
\value{
  \item{cdb}{The R4CouchDB (method) chain(ing) list }
}
\description{
  Function returns a list with some default settings and
  often used functions such as \code{cdb$baseUrl}.
}
\details{
  The list: \code{ cdb <- list(serverName = "localhost",
  ... )} is returned if the packages \code{library(RCurl)}
  and \code{library(RJSONIO)} are successfully loaded.
}
\examples{
\dontrun{
ccc <- cdbIni(digits=13,
              DBName="r4couch_db",
              attachmentsWithPath=FALSE,
              dataList=list(normalDistRand =  rnorm(20)))
}
}
\author{
  wactbprot
}
\keyword{misc}

