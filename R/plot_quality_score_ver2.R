#' Generate a boxplot of the per posistion quality score from basic statistics results
#' @param name the object that is the path to the gzipped FASTQ file
#' @importMethodsFrom ggplot2
#' @return boxplot of per position quality score distribution
#' @example
#' plot_quality_score.2("full.fq.gz")


plot_quality_score.2 <- function(name){

  df <- basic_stat(name)[c("score_q01","score_q25","score_median","score_q75","score_q99"),]

  quantile_df = as.data.frame(t(df))
  colnames(quantile_df) <- c("min","q25","median","q75","max")
  quantile_df$index = seq(1,ncol(df),1)
  p_quality_score <- ggplot2::ggplot(data=quantile_df, ggplot2::aes(x=index))+ggplot2::geom_boxplot(ggplot2::aes(ymin=min,lower=q25,middle = median,upper = q75,ymax = max),stat="identity")+ggplot2::scale_y_continuous(limits = c(0, 50))
  return(p_quality_score)
}
