### * <HEADER>
###
attach(NULL, name = "CheckExEnv")
assign("nameEx",
       local({
	   s <- "__{must remake R-ex/*.R}__"
           function(new) {
               if(!missing(new)) s <<- new else s
           }
       }),
       pos = "CheckExEnv")
## Add some hooks to label plot pages for base and grid graphics
assign("base_plot_hook",
       function() {
           pp <- par(c("mfg","mfcol","oma","mar"))
           if(all(pp$mfg[1:2] == c(1, pp$mfcol[2]))) {
               outer <- (oma4 <- pp$oma[4]) > 0; mar4 <- pp$mar[4]
               mtext(sprintf("help(\"%s\")", nameEx()), side = 4,
                     line = if(outer)max(1, oma4 - 1) else min(1, mar4 - 1),
               outer = outer, adj = 1, cex = .8, col = "orchid", las=3)
           }
       },
       pos = "CheckExEnv")
assign("grid_plot_hook",
       function() {
           grid::pushViewport(grid::viewport(width=grid::unit(1, "npc") -
                              grid::unit(1, "lines"), x=0, just="left"))
           grid::grid.text(sprintf("help(\"%s\")", nameEx()),
                           x=grid::unit(1, "npc") + grid::unit(0.5, "lines"),
                           y=grid::unit(0.8, "npc"), rot=90,
                           gp=grid::gpar(col="orchid"))
       },
       pos = "CheckExEnv")
setHook("plot.new",     get("base_plot_hook", pos = "CheckExEnv"))
setHook("persp",        get("base_plot_hook", pos = "CheckExEnv"))
setHook("grid.newpage", get("grid_plot_hook", pos = "CheckExEnv"))
assign("cleanEx",
       function(env = .GlobalEnv) {
	   rm(list = ls(envir = env, all.names = TRUE), envir = env)
           RNGkind("default", "default")
	   set.seed(1)
   	   options(warn = 1)
	   .CheckExEnv <- as.environment("CheckExEnv")
	   delayedAssign("T", stop("T used instead of TRUE"),
		  assign.env = .CheckExEnv)
	   delayedAssign("F", stop("F used instead of FALSE"),
		  assign.env = .CheckExEnv)
	   sch <- search()
	   newitems <- sch[! sch %in% .oldSearch]
	   for(item in rev(newitems))
               eval(substitute(detach(item), list(item=item)))
	   missitems <- .oldSearch[! .oldSearch %in% sch]
	   if(length(missitems))
	       warning("items ", paste(missitems, collapse=", "),
		       " have been removed from the search path")
       },
       pos = "CheckExEnv")
assign("ptime", proc.time(), pos = "CheckExEnv")
## at least one package changes these via ps.options(), so do this
## before loading the package.
## Use postscript as incomplete files may be viewable, unlike PDF.
## Choose a size that is close to on-screen devices, fix paper
grDevices::ps.options(width = 7, height = 7, paper = "a4", reset = TRUE)
grDevices::postscript("R4CouchDB-Ex.ps")

assign("par.postscript", graphics::par(no.readonly = TRUE), pos = "CheckExEnv")
options(contrasts = c(unordered = "contr.treatment", ordered = "contr.poly"))
options(warn = 1)
library('R4CouchDB')

assign(".oldSearch", search(), pos = 'CheckExEnv')
assign(".oldNS", loadedNamespaces(), pos = 'CheckExEnv')
cleanEx(); nameEx("R4CouchDB-package")
### * R4CouchDB-package

flush(stderr()); flush(stdout())

### Name: R4CouchDB-package
### Title: Collection of R functions for CouchDB access
### Aliases: R4CouchDB-package R4CouchDB
### Keywords: package

### ** Examples

## get the list structure
cdb <- cdbIni()
## this structure includes:
cdb
## the command
cdb <- cdbListDB(cdb)
## yields
cdb$error



cleanEx(); nameEx("cdbGetUuids")
### * cdbGetUuids

flush(stderr()); flush(stdout())

### Name: cdbGetUuids
### Title: Function for id generation
### Aliases: cdbGetUuids
### Keywords: misc

### ** Examples

cdb <- cdbIni()
cdbGetUuids(cdb)$id



cleanEx(); nameEx("cdbGetView")
### * cdbGetView

flush(stderr()); flush(stdout())

### Name: cdbGetView
### Title: Receive view results from CouchDB
### Aliases: cdbGetView
### Keywords: misc

### ** Examples

## Not run:
## If:
## function(doc) {
##  emit(null, doc._id);
## }
## is stored under design: test, view: id
## in the database db5r

cdb <- cdbIni()
cdb$DBName <- "db5r"
cdb$design <- "test"
cdb$view <- "id"

## cdbGetView(cdb)$res




cleanEx(); nameEx("cdbIni")
### * cdbIni

flush(stderr()); flush(stdout())

### Name: cdbIni
### Title: Ini function
### Aliases: cdbIni
### Keywords: misc

### ** Examples

d <- cdbIni()
cdbListDB(d)$res



cleanEx(); nameEx("cdbListDB")
### * cdbListDB

flush(stderr()); flush(stdout())

### Name: cdbListDB
### Title: Returns all databases
### Aliases: cdbListDB
### Keywords: misc

### ** Examples

cdb <- cdbIni()
cdbListDB(cdb)$res



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
