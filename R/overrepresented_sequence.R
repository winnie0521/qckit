overrepresented_sequence <- function(){
  # use system to extract unique counts and count them
  a<-system("awk 'NR%4==2' 10^5_reads_test.fq | cut -c 1-50 | sort ",intern = TRUE)
  over_rep <- as.data.frame(a)
}
