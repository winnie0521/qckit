seq_meidan<- function(x){

  #load the data seqTool
  fseq<- seqTools::fastqq(x)
  quality_median_seq = as.vector(as.matrix(seqTools::phredQuantiles(fseq,0.5,1)))
  return(quality_median_seq)
}
