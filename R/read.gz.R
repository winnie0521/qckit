read.gz <- function(){
  command <- "/home/aragaven/fastqsplitter/build/./fastqsplitter /home/winnie/data/LL11_S16_R2_001.fastq.gz  all_reads"
  system(command,intern=TRUE)
}
