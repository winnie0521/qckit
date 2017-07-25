plot_quality_score.2 <- function(name){
  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  # create a new dataframe to include quantile values for graphing
  df <- data.frame(matrix(ncol = ncol(scorecycle), nrow = 5))

  #df[1,] <- apply(scorecycle,2,min)
  df[1,] <- apply(scorecycle,2,function(x) quantile(x,0.01))
  df[2,] <- apply(scorecycle,2,function(x) quantile(x,0.25))
  df[3,] <- apply(scorecycle,2,median)
  df[4,] <- apply(scorecycle,2,function(x) quantile(x,0.75))
  #df[5,] <- apply(scorecycle,2,max)
  df[5,] <- apply(scorecycle,2,function(x) quantile(x,0.99))
  rownames(df) <- c("min","q25","median","q75","max")


  quantile_df = as.data.frame(t(df))
  quantile_df$index = seq(1,ncol(df),1)
  p_quality_score <- ggplot2::ggplot(data=quantile_df, ggplot2::aes(x=index))+ggplot2::geom_boxplot(ggplot2::aes(ymin=min,lower=q25,middle = median,upper = q75,ymax = max),stat="identity")+ggplot2::scale_y_continuous(limits = c(0, 50))
  return(p_quality_score)
}
