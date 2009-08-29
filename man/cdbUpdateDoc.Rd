\name{cdbUpdateDoc}
\Rdversion{1.1}
\alias{cdbUpdateDoc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
cdbUpdateDoc(cdb)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cdb}{
%%     ~~Describe \code{cdb} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (cdb) 
{
    if (cdb$id == "") {
        cdb$error <- paste(cdb$error, " no cdb$id given ", sep = " ")
    }
    if (cdb$rev == "") {
        cdb <- cdbGetDoc(cdb)
        cdb$rev <- cdb$res$"_rev"
    }
    if (length(cdb$dataList) < 1) {
        cdb$error <- paste(cdb$error, " no cdb$dataList given", 
            sep = " ")
    }
    if (cdb$error == "") {
        cdb <- cdbGetDoc(cdb)
        cdb$rev <- cdb$res$"_rev"
        data <- toJSON(list(`_id` = cdb$id, `_rev` = cdb$rev, 
            cdb$dataList))
        adrString <- paste("http://", cdb$serverName, ":", cdb$port, 
            "/", cdb$DBName, "/", cdb$id, sep = "")
        header <- list(`Content-Type` = "application/json")
        reader <- basicTextGatherer()
        res <- getURLContent(customrequest = "PUT", url = adrString, 
            postfields = data, headerfunction = reader$update)
        cdb$res <- fromJSON(res)
        cdb <- cdbGetDoc(cdb)
        cdb$rev <- cdb$res$"_rev"
        return(cdb)
    }
    else {
        print(cdb$error)
        return(cdb)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
