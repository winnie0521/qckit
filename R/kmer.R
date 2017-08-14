#' Extract kmers and kmer counts from FASTQ file to a data frame
#' @param name the object that is the path to  gzipped FASTQ file
#' @param kcount the object that is the length of kmer that is in interest
#' @importMethodsFrom seqTools
#' @return data frame of kmer and corresponding kmer count of the length of choice
#' @example
#' kmer("full.fq.gz",7)


kmer <- function(name,kcount){
  defaultcommand <- "gunzip -c FCHF3TNBBXX_L2_Cord_Blood_F_L2V18DR-BC2_1.fq.gz | split -l 1000000"
  command <- sub("FCHF3TNBBXX_L2_Cord_Blood_F_L2V18DR-BC2_1.fq.gz",name,defaultcommand)
  system(command,intern=TRUE)
  file_list <- list.files()
  split_files <- grep("^x",file_list,value=TRUE)

  #construct empty data frame with 4^k rows and column same with data

  sequence_length <- seqTools::fastqq(name)@maxSeqLen
  fseq_count <- as.data.frame(matrix(0, nrow=4^kcount,ncol=sequence_length-kcount+1))

  for (i in 1:length(split_files)){
    kmer_count = as.data.frame(seqTools::fastqKmerLocs(split_files[i],kcount))
    kmer_count = as.data.frame(t(apply(kmer_count,1,as.numeric)))
    fseq_count = fseq_count + kmer_count
    rownames(fseq_count) = rownames(kmer_count)
  }
  file.remove(split_files)

  return(fseq_count)
}
