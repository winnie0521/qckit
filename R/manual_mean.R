 manual_mean <- function(x){

  file_name = x
  #read the data ShortRead
  fastq <- ShortRead::readFastq(file_name)
  ## as a quality score matrix
  scorecycle<-as(Biostrings::quality(fastq), "matrix")
  quality_mean_sr<-as.vector(colMeans(as.data.frame(scorecycle)))
  return(quality_mean_sr)
}
