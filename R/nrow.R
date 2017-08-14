#' Calculate the number of read for a given Fastq file
#'
#' \code{nreads}use seqTool to extract the number of reads of a Fastq G zipped file
#' @param name an object that is the path to the gzippped Fastq file
#' @return a numeric value of the read count
#' @export
#' @example nreads("full.fq.gz")
nreads <- function(name){
  fseq<- seqTools::fastqq(name)
  nrow <- fseq@nReads
  return(nrow)
}
