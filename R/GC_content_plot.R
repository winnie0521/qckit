#' Generate GC content plot from the GC content
#' @param nc the object that is the number of positions of the FASTQ files
#' @param gc_df the object that is the GC content vectors generated from GC content function
#' @param writefile the object indicating intent to save the plot as pdf file, set default as FALSE
#' @importMethodsFrom ggplot2
#' @return a ggplot of the GC content acorss all positions
#' @example GC_content(100,gc_df,writefile=TRUE)
#'
#'
#'
GC_content <- function(nc,gc_df,writefile=FALSE){
  p1 <- ggplot2::ggplot(data=gc_df, ggplot2::aes(meanGC)) +ggplot2::geom_histogram(breaks=seq(0, ncol(contentcycle), by=1))
  p_GC <- p1 + ggplot2::labs(title = "Histograms for GC content percentage", x= "Mean GC content percentage" , y = "Frequency")
  if (writefile=TRUE){ggplot2::ggsave(file="GC_content.pdf",p_GC)}
  return(p_GC)
}
