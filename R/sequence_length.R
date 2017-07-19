sequence_length <- function(name){
  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")

  sequence_length <- as.vector(apply(contentcycle,1,length))
  barplot(table(sequence_length),xlab="sequence length",ylab = "frequency")
}
