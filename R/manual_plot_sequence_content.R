plotSeq<- function(name){
  #read the data ShortRead

  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")
  organized_contentcycle <- apply(contentcycle,2,add_N_function)
  g_content_sr <- as.matrix(organized_contentcycle["G",])
  a_content_sr <- as.matrix(organized_contentcycle["A",])
  t_content_sr <- as.matrix(organized_contentcycle["T",])
  c_content_sr <- as.matrix(organized_contentcycle["C",])
  n_content_sr <- as.matrix(organized_contentcycle["N",])

  content_cycle <- as.data.frame(t(as.data.frame(organized_contentcycle)))
  content_cycle$base <- seq(1,nrow(content_cycle),1)

  organized_content_cycle <- content_cycle%>%tidyr::gather(key,value,"A","T","G","C","N")

  p_content <- ggplot2::ggplot(data=organized_content_cycle,ggplot2::aes(x=base,y=value,colour=key))+ggplot2::geom_line()
  p_content

  return(p_content)
}
