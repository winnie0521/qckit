manual_median <- function(x){

  #read the data ShortRead
  fastq <- ShortRead::readFastq(x)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  quality_median_sr <- apply(scorecycle,2,median)
  return(quality_median_sr)
}
