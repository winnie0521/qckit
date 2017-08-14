#' Extract nucleoctide sequence content per position from fastq file
#'
#' @param name an object that is the path to zipped Fastq file
#' @param content an object of string type that specifies the content in question, "A","T","G","C","N"(either capital or lower case)
#' @importMethodsFrom seqTools
#' @return the per position
#' @example
#' sequence_content("full.fq.gz","G")

sequence_content <- function(name,content){

  #load the data seqTool
  fseq<- seqTools::fastqq(name)
  nucCount_seq <- seqTools::nucFreq(fseq,1)
  specific_content <- nucCount_seq[tolower(content),]
  return(as.vector(specific_content))
}
