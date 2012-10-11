#' Ini function
#' 
#' Function returns a list with some default settings and often used functions
#' such as \code{cdb$baseUrl}.
#' 
#' The list: \code{ cdb <- list(serverName = "localhost", ... )} is returned if
#' the packages \code{library(RCurl)} and \code{library(RJSONIO)} are
#' successfully loaded.
#' 
#' @usage cdbIni(serverName="localhost",port="5984",dbname="")
#' @return
#' 
#' \item{cdb}{see details for the default settings of this function }
#' @author wactbprot
#' @export
#' @keywords misc
