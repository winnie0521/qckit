#'
#' \code{ncolumn}use seqTool to read a Fastq G zipped file
#' @param name the object that is the path to the G zipped Fastq file
#' @importMethodsFrom seqTools
#' @return the seqTools read result of the FASTQ file
#' @export
#' @example
#' dimensions("full.fq.gz",'reads')


seq.read <- function(name){
  fseq <- seqTools::fastqq(name)
  return(fseq)
}
