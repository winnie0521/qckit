#' Extract GC content separately and calculate GC content percentage for each sequence read
#' \code{GC_content} Use SQLite table to extract per position GC content and use ggplot for plotting
#' @param nc the object that is the number of positions of the FASTQ file
#' @param nr the object that is the number of reads of the FASTQ file
#' @importMethodsFrom RSQLite
#' @return plot of GC content
#' @example
#' GC_content(100)


GC_content <- function(nc,nr){

  conn <- RSQLite::dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  cols <- paste(paste("V",seq(1:nc),sep=""), collapse=" || ")
  gcquerydefault <- paste("SELECT ",cols, " as gc_table FROM contentTableFull")
  gc_result<-(RSQLite::dbGetQuery(conn,gcquerydefault))
  gc_list <-sapply(gc_result$gc_table,function(x) {table(unlist(strsplit(x,'')))})
  gc_percent <- sapply(gc_list[1:nr], function(x)
  {
    y<-c(0)
    if ( "G" %in% names(x)){ y[1] <- x[names(x)=="G"]}
    if ("C" %in% names(x)){y[2] <-x[names(x)=="C"]}
    y[3] =y[1]+y[2]
    return(y[3])
  })

  gc_df <- as.data.frame(gc_percent)
  colnames(gc_df) = c("meanGC")
  return(gc_df)
}
