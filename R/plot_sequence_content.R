plotSeqContent<- function(name){
  #read the data ShortRead

  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")
  organized_contentcycle <- apply(contentcycle,2,add_N_function)

  content_cycle <- as.data.frame(t(as.data.frame(organized_contentcycle)))/nrow(contentcycle)*ncol(contentcycle)
  content_cycle$base <- seq(1,nrow(content_cycle),1)

  organized_content_cycle <- content_cycle%>%tidyr::gather(key,value,"A","T","G","C","N")

  p1 <- ggplot2::ggplot(data=organized_content_cycle,ggplot2::aes(x=base,y=value,colour=key))+ggplot2::geom_line()
  p2 <- p1 + ggplot2::labs(x = "Position", y= "Percentage of content", title = "Per base sequence content percentage")
  p_content <- p2 + ggplot2::guides(fill=ggplot2::guide_legend(title="Sequence Content"))

  return(p_content)
}
