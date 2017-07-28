plot_perseq_quality <- function(scorecycle){

  scorecycle_df <- as.data.frame(scorecycle)
  colnames(scorecycle_df) = seq(1,ncol(scorecycle),1)

  score_sequence_mean <- as.data.frame(apply(scorecycle,1,mean))
  colnames(score_sequence_mean) <- c("sequencemean")

  p1 <- ggplot2::ggplot(data=score_sequence_mean, ggplot2::aes(sequencemean)) +ggplot2::geom_histogram()
  p_perseq_quality <- p1 + ggplot2::labs(title = "Histograms of per sequence mean quality ", x= "Mean Quality Score" , y = "Frequency")
  return(p_perseq_quality)
}
