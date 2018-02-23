#' Plot all plots about the FASTQ file and save them in a pdf as comprehensive report
#' @param  name the object that is the path to the gzipped FASTQ file
#' @param nc the number of positions in the dataset
#' @param nr the number of reads in the dataset
#' @param basic_stat the dataframe of the basic stat informations
#' @param fseq the object that is the seqTools processed data



plotall <- function(name,nr,nc,basic_stat,fseq){
  perseq_quality <- plot_perseq_quality(nc)
  quality_score <- plot_quality_score.2(basic_stat)
  sequence_content <- plotSeqContent(fseq,nr,nc)
  sequence_length <- sequence_length(fseq)
  arranged_graph <- gridExtra::grid.arrange(perseq_quality,quality_score,sequence_content,sequence_length,ncol=2,top=paste("Plot all for",name,sep=""))
  ggplot2::ggsave(file = "plotall.pdf",arranged_graph,width = 16, height = 9, dpi = 120)
}
