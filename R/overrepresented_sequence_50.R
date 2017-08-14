#' Sort all sequences per read by count along with a density plot of all counts with top 5 repreated sequences marked
#' cut only the first 50 characters from the sequence
#' @param name the object that is the path to gzippped FASTQ file
#' @return  table of sequnces sortted by count
#' @return  density plot of sequence length with top 5 marked by rugs, saved as PDF file
#' @importMethodsFrom dplyr
#' @importMethodsFrom plot
#' @example overrepresented_sequence("full.fq.gz")

overrepresented_sequence_50 <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname  | awk 'NR%4==2'| cut -c 1-50 | sort |uniq -c | sort -r > over_rep_reads_50.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep_50 <- data.table::fread("over_rep_reads_50.txt")
  over_rep_table_50 <- as.data.frame(over_rep_50%>%dplyr::arrange(desc(V1)))
  write.csv(over_rep_table_50,file = "overrepresented_sequence_50.csv")
  return(over_rep_table_50)
}
