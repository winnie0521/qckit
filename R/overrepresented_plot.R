#' Plot the top 5 seqeunces
#' @param over_rep_table the table that sorts the sequence content and corresponding counts in descending order
#' @export plot of the top 5 overrepresented sequences


overrep_plot <- function(over_rep_table){
  pdf(file = "file_OverrepresentedSequencePlot.pdf")
  plot(density(as.numeric(over_rep_table$V1)),main = "Overrepresented Sequence Histogram with top 5 rug",ylab="Density",xlab="Sequence Count")
  rug(over_rep_table$V1[1:5],col=2, lwd=3.5)
  dev.off()
}
