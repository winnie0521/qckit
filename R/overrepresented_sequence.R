#' Sort all sequences per read by count along with a density plot of all counts with top 5 repreated sequences marked
#' @param name the object that is the path to gzippped FASTQ file
#' @return  table of sequnces sortted by count
#' @return  density plot of sequence length with top 5 marked by rugs, saved as PDF file



overrepresented_sequence <- function(name){
  # use system to extract unique counts and count them
  # need to refactor and add in C ++ function

  default <- "gunzip -c defaultname | awk 'NR%4==2' | sort |uniq -c | sort -r > over_rep_reads.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep <- data.table::fread("over_rep_reads.txt")
  over_rep_table <- as.data.frame(over_rep%>%dplyr::arrange(desc(V1)))
  write.csv(over_rep_table,file = "overrepresented_sequence.csv")


  pdf(file = "file2_OverrepresentedSequencePlot.pdf")
  plot(density(as.numeric(over_rep_table$V1)),main = "Overrepresented Sequence Histogram with top 5 rug",ylab="Density",xlab="Sequence Count")
  rug(over_rep_table$V1[1:5],col=2, lwd=3.5)
  dev.off()
  return(over_rep_table)
}

