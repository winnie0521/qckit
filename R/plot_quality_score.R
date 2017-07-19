plot_quality_score <- function(name){
  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ## as a quality score matrix
  scorecycle<-as(ShortRead::quality(fastq), "matrix")
  a<-melt(as.data.frame(scorecycle))
  p_quality_score <- ggplot(data=a, aes(variable, value)) + geom_boxplot()+geom_smooth()
  p_quality_score
}
