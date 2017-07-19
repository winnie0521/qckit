seq_quantile<- function(name,q){

  #load the data seqTool
  fseq<- seqTools::fastqq(name)
  quality_median_seq = as.vector(as.matrix(seqTools::phredQuantiles(fseq,q,1)))
  return(quality_median_seq)
}

