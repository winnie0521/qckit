sequence_length <- function(name){

  fullseq <- seqTools::fastqq(name)

  len_table <- as.data.frame(seqTools::seqLenCount(fullseq))
  colnames(len_table) = c("count")
  len_table$seq_length = as.numeric(rownames(len_table))

  p1 <-ggplot2::ggplot(len_table,ggplot2::aes(x=seq_length,y=count))+ggplot2::geom_bar(stat="identity")
  p2 <-p1 + ggplot2::geom_text(ggplot2::aes(label=count), vjust=0)
  p_sequence_length <- p2 + ggplot2::labs(x = "Sequence length", y = "Number of reads with sequence length specified",title = "Sequence length distribution")
  return(p_sequence_length)
}

