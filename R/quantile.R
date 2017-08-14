#‘ Generate quantiles of quality score per position
#' \code{seq_quantile} Use seqTools to find the quantile of chosen percentage of quality score per position
#' @param name the object that is the path to the gzipped FASTQ file
#' @param q the object that is the percentage of the quanitle
#' @importMethodsFrom seqTools
#' @return vector of the per position quantiles of quality score
#' @example
#' seq_quantile("full.fq.gz")


seq_quantile<- function(name,q){

  #load the data seqTool
  fseq<- seqTools::fastqq(name)
  quality_median_seq = as.vector(as.matrix(seqTools::phredQuantiles(fseq,q,1)))
  return(quality_median_seq)
}

