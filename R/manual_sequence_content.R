manual_sequence_content<-function(name,content){

  #read the data ShortRead

  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")

  organized_contentcycle <- apply(contentcycle,2,add_N_function)

  content_sr <- as.matrix(organized_contentcycle[toupper(content),])
  return(as.vector(content_sr[,1]))
}
