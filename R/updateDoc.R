updateDoc <- function( couchConConv){

  if( couchConConv$id == ""){
    couchConConv$error <- "no couchConConv$id given"

  }

  if( couchConConv$rev == ""){

    ## first I need getDoc.R
    couchConConv$rev <- couchConConv$$'_rev'
  }
}
