\name{cdbGetConfig}
\Rdversion{1.1}
\alias{cdbGetConfig}

\title{
Request couchdb config
}
\description{
Function provides access to the \code{_config} api end point
}

\arguments{
   \item{cdb}{ Only the  connection settings \code{cdb$port} and
     \code{cdb$serverName} is needed.
}
}

\value{

  \item{cdb }{The result of the request is stored in \code{cdb$re} after
    converting the answer into a list using \code{fromJSON()}.
  }
}
\references{

  \url{  http://www.omegahat.org/RCurl/        }
  \url{  http://www.omegahat.org/RJSONIO/      }
  \url{  http://couchdb.apache.org/            }

}
\author{
  wactbprot
}

\seealso{
\code{cdbMakeDB}
}
\keyword{ misc }

