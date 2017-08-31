#' Plot the per position nucleotide content
#' \code{plotSeqContent}
#' @param  name the object that is the path to the gzipped FASTQ file
#' @param nr the number of reads of the FASTQ file, acquired through previous functions
#' @param nc the number of positions of the FASTQ file, acquired through previous functions
#' @importMethodsFrom seqTools
#' @importMethodsFrom ggplot2
#' @importMethodsFrom reshape2
#' @importMethodsFrom qckit::sequence_content
#' @importMethodsFrom qckit::dimensions
#' @return ggplot line plot of all nucleotide content inclding  A, T, G, C and N

plotSeqContent<- function(fseq,nr,nc){

  G_content<- sequence_content(fseq,"G")
  C_content<- sequence_content(fseq,"C")
  T_content<- sequence_content(fseq,"T")
  A_content<- sequence_content(fseq,"A")
  N_content<- sequence_content(fseq,"N")

  df <- data.frame(G_content,C_content,T_content,A_content,N_content)/nr*nc
  dfm <- reshape2::melt(df)
  dfm$position <- rep(seq(1,nc,1), 5)
  p1 <- ggplot2::ggplot(dfm,aes(x= as.numeric(position),y=value,colour = variable))+geom_line()
  p2 <- p1 + ggplot2::labs(x = "Position", y= "Percentage of content", title = "Per base sequence content percentage")
  p_content <- p2 + ggplot2::guides(fill=ggplot2::guide_legend(title="Sequence Content"))

  return(p_content)
}
