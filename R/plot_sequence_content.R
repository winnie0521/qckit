plotGC <- function(name){

  # n content from FastQCR

  per_base_sequence_content <- as.data.frame(qc_read(name,"Per base sequence content"))

  per_base_n <- as.data.frame(qc_read(name,"Per base N content"))

  per_base_n_content <- per_base_n$per_base_n_content.N.Count

  per_base_sequence_content_N = cbind(per_base_sequence_content,per_base_n_content)

  colnames(per_base_sequence_content_N)=c("base","contentG","contentA","contentT","contentC","contentN")

  #organize the dataframe

  organized_sequence_content <-per_base_sequence_content_N%>%gather(key,value,contentG,contentA,contentT,contentC,contentN)

  #plot the sequence content ATGC in one graph


  p_content <- ggplot(data=organized_sequence_content,aes(x=base,y=value,colour=key))+geom_line()+ggtitle("Per base sequence content")
  p_content

  ggsave("content.pdf",plot=p_content)
}
