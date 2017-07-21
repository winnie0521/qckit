plot_quality_score <- function(name){
  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  scorecycle_df <- as.data.frame(scorecycle)
  colnames(scorecycle_df) = seq(1,ncol(scorecycle),1)
  #reshape the scorecycle for graphing

  score_melt<-reshape2::melt(scorecycle_df)
  labels <- seq(0, ncol(scorecycle), 10)
  p_quality_score <- ggplot2::ggplot(score_melt, ggplot2::aes(x =variable , y = value))+stat_boxplot_custom(qs = c(0.01, 0.25, 0.5, 0.75, 0.99))+ggplot2::labs(x = "Positions", y = "Quality Score",title = "Per base sequence quality")+ggplot2::scale_x_discrete(breaks=labels, labels=as.character(labels))
  return(p_quality_score)

}
