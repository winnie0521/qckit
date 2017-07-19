seq_mean <- function(x){

  file_name = x
  #load the data seqTool
  fseq<- seqTools::fastqq(file_name)
  #extract matrix of quality score count from seqTools

  seq_quality_score <- as.data.frame(seqTools::mergedPhred(fseq))

  sum_quality = rep(0,ncol(seq_quality_score))

  for (j in 1:ncol(seq_quality_score)){
    for (i in 1:nrow(seq_quality_score)){

      sum_quality[j] = sum_quality[j]+seq_quality_score[i,j]*(i-1)
      count = sum(seq_quality_score[,j])
    }
  }

  # mean from seqTools
  quality_mean_seq = sum_quality/count
  return(quality_mean_seq)


}
