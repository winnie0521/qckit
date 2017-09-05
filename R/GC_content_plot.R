#' Extract GC content and construct a plot of GC content per position
#' \code{GC_content} Use SQLite table to extract per position GC content and use ggplot for plotting
#' @param name the object that is the path to the gzipped FASTQ file
#' @importMethodsFrom ggplot2
#' @importMethodsFrom RSQLite
#' @return plot of GC content
#' @example
#' GC_content("full.fq.gz")


GC_content <- function(nc){

  conn <- RSQLite::dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  cols <- paste(paste("V",seq(1:nc),sep=""), collapse=" || ")
  gcquerydefault <- paste("SELECT ",cols, " as gc_table FROM contentTableFull")
  gc_result<-(RSQLite::dbGetQuery(conn,gcquerydefault))
  gc_list <-sapply(gc_result$gc_table,function(x) {table(unlist(strsplit(x,'')))})
  gc_percent <- sapply(gc_list[1:nc], function(x)
  {
    y<-c(0,0,0,0)
    if ( "G" %in% names(x)){ y[1] <- x[names(x)=="G"]}
    if ("C" %in% names(x)){y[2] <-x[names(x)=="C"]}
    y[3] <-sum(x)
    y[4] = y[1]+y[2]
    return(y)

  })

  gc <- gc_percent
  gc_df <- as.data.frame(gc[4,])
  colnames(gc_df) = c("meanGC")

  p1 <- ggplot2::ggplot(data=gc, ggplot2::aes(meanGC)) +ggplot2::geom_histogram(breaks=seq(0, ncol(contentcycle), by=1))
  p_GC <- p1 + ggplot2::labs(title = "Histograms for GC content percentage", x= "Mean GC content percentage" , y = "Frequency")
  return(p_GC)

}
