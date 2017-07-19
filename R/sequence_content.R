sequence_content <- function(name,content){

  #load the data seqTool
  fseq<- seqTools::fastqq(name)
  nucCount_seq <- seqTools::nucFreq(fseq,1)
  specific_content <- nucCount_seq[tolower(content),]
  return(as.vector(specific_content))
}
