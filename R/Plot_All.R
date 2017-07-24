plotall <- function(name){
  perseq_quality <- plot_perseq_quality(name)
  quality_score <- plot_quality_score(name)
  sequence_content <- plotSeqContent(name)
  sequence_length <- sequence_length(name)
  arranged_graph <- gridExtra::grid.arrange(perseq_quality,quality_score,sequence_content,sequence_length,ncol=2,top=paste("Plot all for",name,sep=""))
  ggplot2::ggsave(file = "plotall.pdf",arranged_graph,width = 16, height = 9, dpi = 120)
}
