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
                serverName = "localhost",
                port = "5984",
                prot = "http",
                uname="",
                pwd="", 
                curl=getCurlHandle(),
                DBName="",
                newDBName="",
                removeDBName="",
                id="",
                rev="",
                dataList=list(),
                fileName="",
                design="",
                view="",
                queryParam="",
                date=toString(Sys.Date()),
                error="",
                res=""
                )

    cdb$baseUrl <- function(cdb){
      mid <- if(cdb$uname == ""){""}else{paste(cdb$uname,":",cdb$pwd,"@",sep="")}
      baseUrl <- paste(cdb$prot,"://",mid,cdb$serverName,"/", sep="")
      return(baseUrl)
    }
} is returned if the packages \code{library(RCurl)} and
\code{library(RJSONIO)} are successfully loaded.
}
\value{

  \item{cdb}{see details for the default settings of this function
}
}
\author{
  wactbprot
}
\keyword{ misc }

