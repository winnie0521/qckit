kmer <- function(name,kcount){
  fseq_k<- seqTools::fastqq(name,k=kcount)
  fseq_count = as.data.frame(seqTools::kmerCount(fseq_k))

  fseq_count$index = seq(1,4^kcount,1)
  return(fseq_count)
}
