plotSeqContent<- function(name){
  #read the data ShortRead

  nc <- ncolumn(name)
  nr <- nreads(name)

  G_content<- sequence_content(name,"G")
  C_content<- sequence_content(name,"C")
  T_content<- sequence_content(name,"T")
  A_content<- sequence_content(name,"A")
  N_content<- sequence_content(name,"N")

  df <- data.frame(G_content,C_content,T_content,A_content,N_content)/nr*nc
  dfm <- reshape2::melt(df)
  dfm$position <- rep(seq(1,nc,1), 5)


  p1 <- ggplot2::ggplot(dfm,aes(x= as.numeric(position),y=value,colour = variable))+geom_line()
  p2 <- p1 + ggplot2::labs(x = "Position", y= "Percentage of content", title = "Per base sequence content percentage")
  p_content <- p2 + ggplot2::guides(fill=ggplot2::guide_legend(title="Sequence Content"))

  return(p_content)
}
