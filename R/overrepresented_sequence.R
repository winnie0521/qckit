overrepresented_sequence <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname | awk 'NR%4==2' | sort |uniq -c | sort -r > over_rep_reads.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep <- data.table::fread("over_rep_reads.txt")
  over_rep_table <- as.data.frame(over_rep%>%dplyr::arrange(desc(V1)))
  write.csv(over_rep_table,file = "overrepresented_sequence.csv")
  return(over_rep_table)
}
