nreads <- function(name){
  fseq<- seqTools::fastqq(name)
  nrow <- fseq@nReads
  return(nrow)
}
