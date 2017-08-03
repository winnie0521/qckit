overrepresented_sequence_50 <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname  | awk 'NR%4==2'| cut -c 1-50 | sort |uniq -c | sort -r > over_rep_reads_50.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep_50 <- data.table::fread("over_rep_reads_50.txt")
  over_rep_table_50 <- as.data.frame(over_rep%>%dplyr::arrange(desc(V1)))
  return(over_rep_table_50)
}
