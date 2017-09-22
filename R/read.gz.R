#' Read in and process the FASTQ file to several csv files containing nucletoide sequence content and quality score
#' @param name the path to the FASTQ file
#' @param title the desired title of the output csv files
#'


read.gz <- function(name,title){
  command_title <- paste("/home/aragaven/fastqsplitter/build/./fastqsplitter /home/winnie/data/LL11_S16_R2_001.fastq.gz  ",title)
  command <- sub("data/LL11_S16_R2_001.fastq.gz",name,command_title)
  system(command,intern=TRUE)
}
