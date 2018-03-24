#' Return kmer count per sequence for the length of kmer desired
#' @param path the object that is the path to gzippped FASTQ file
#' @param k the length of kmer
#'
#' @return  Kmers counts per sequence
#' @export



Kmer <- function(path,k){
  fseq <- seqTools::fastqq(path)
  fseq_count <- seqTools::fastqKmerLocs(path,k)[[1]]
  return(fseq_count)
}
