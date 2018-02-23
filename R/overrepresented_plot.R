#' Plot the top 5 seqeunces
#' @param overrep_order the table that sorts the sequence content and corresponding counts in descending order
#' @param prefix the prefix tot he file saved
#'
#' @return plot of the top 5 overrepresented sequences


overrep_plot <- function(overrep_order,prefix){
  pdf(file = paste(prefix,"OverrepresentedSequencePlot.pdf"))
  plot(density(overrep_order),main = "Overrepresented Sequence Histogram with top 5 rug",ylab="Density",xlab="Sequence Count")
  rug(overrep_order[1:5],col=2, lwd=3.5)
  dev.off()
}
