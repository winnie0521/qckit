manual_quantile <- function(name,q){

  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  quality_median_sr <- apply(scorecycle,2,function(x) quantile(x,q))
  return(quality_median_sr)
}
