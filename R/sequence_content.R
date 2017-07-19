sequence_content <- function(name){

  #load the data seqTool
  fseq<- seqTools::fastqq(name)
  nucCont_seq <- seqTools::nucFreq(fseq,1)
  return(nucCont_seq)
}
