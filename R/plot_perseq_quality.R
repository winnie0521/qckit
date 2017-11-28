#' plot the mean quality score per read in histograms
#' \code{plot_perseq_quality}
#' @param infile the object that is the path to the file that
#' @return plot of mean quality score per read


plot_perseq_quality <- function(infile){

  score_sequence_mean <- data.frame(qual_score_per_read(infile))
  colnames(score_sequence_mean) <- c("sequencemean")

  p1 <- ggplot2::ggplot(data=score_sequence_mean, ggplot2::aes(sequencemean)) +ggplot2::geom_histogram()
  p_perseq_quality <- p1 + ggplot2::labs(title = "Histograms of per sequence mean quality ", x= "Mean Quality Score" , y = "Frequency")
  return(p_perseq_quality)
}
