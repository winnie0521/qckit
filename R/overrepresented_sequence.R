overrepresented_sequence <- function(name){
  # use system to extract unique counts and count them
  default <- "gunzip -c defaultname | awk 'NR%4==2' | sort |uniq -c | sort -r "
  command <- sub("defaultname",name,default)
  a<-system(command,intern = TRUE)
  over_rep <- as.data.frame(a)
  return(over_rep)
}
