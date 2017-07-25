overrepresented_sequence <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname | awk 'NR%4==2' | sort |uniq -c | sort -r > over_rep_reads.txt "
  command <- sub("defaultname",name,default)
  system(command,intern = TRUE)
  over_rep <- read.table("over_rep_reads.txt",sep="/n")
  over_rep_table <- as.data.frame(over_rep %>% dplyr::group_by(a)%>%summarize(count=n())%>%arrange(desc(count)))
  return(over_rep_table)
}
