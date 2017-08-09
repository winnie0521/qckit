overrepresented_sequence <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname | awk 'NR%4==2' | sort |uniq -c | sort -r > over_rep_reads.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep <- data.table::fread("over_rep_reads.txt")
  over_rep_table <- as.data.frame(over_rep%>%dplyr::arrange(desc(V1)))
  write.csv(over_rep_table,file = "overrepresented_sequence.csv")

  hist(as.numeric(over_rep_table$V1),breaks=100)


  pdf(file = "OverrepresentedSequencePlot.pdf")
  plot(density(as.numeric(over_rep_table$V1)),main = "Overrepresented Sequence Histogram with top 5 rug",ylab="Density",xlab="Sequence Count")
  rug(over_rep_table$V1[1:5],col=2, lwd=3.5)
  dev.off()
  return(over_rep_table)
}

