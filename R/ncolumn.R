ncolumn <- function(name){
  fseq<- seqTools::fastqq(name)
  ncolumn <- fseq@maxSeqLen
  return(ncolumn)
}
