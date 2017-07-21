sequence_length <- function(name){
  #read the data ShortRead
  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")

  sequence_length <- as.vector(apply(contentcycle,1,length))
  len_table = table(sequence_length)
  for(i in 30:min(names(len_table))-1)
  {
    old_names <-names(len_table)
    len_table <- c(len_table,0)
    names(len_table) <- c(old_names,i)
  }
  len_table=data.frame(list(count=len_table,seq_length=as.numeric(as.character(names(len_table)))))

  p1 <-ggplot2::ggplot(len_table,ggplot2::aes(x=seq_length,y=count))+ggplot2::geom_bar(stat="identity")
  p2 <-p1 + ggplot2::geom_text(ggplot2::aes(label=count), vjust=0)
  p_sequence_length <- p2 + ggplot2::labs(x = "Sequence length", y = "Number of reads with sequence length specified",title = "Sequence length distribution")
  return(p_sequence_length)
}

