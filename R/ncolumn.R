#' Calculate the number of sequences for Fastq file
#'
#' \code{ncolumn}use seqTool to extract the sequence length of a Fastq G zipped file
#' @param name an object that is the path to the gzippped Fastq file
#' @importMethodsFrom seqTools
#' @return a numeric value of the sequence length
#' @export
#' @example ncolumn("full.fq.gz")
ncolumn <- function(name){
  fseq<- seqTools::fastqq(name)
  ncolumn <- fseq@maxSeqLen
  return(ncolumn)
}
