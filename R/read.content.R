contentcycle <- function(){

  # write tables to csv files
  #commanddefault <- 'gunzip -c 10^6_reads_test.fq.gz | paste - - - - | cut -f 2 |awk "{split($0, chars, /"/" ) ;for (i=1; i <= length($0); i++) {printf("%s,", chars[i])}; printf("\n")}" > full.reads.csv'
  #command <- sub("10^6_reads_test.fq.gz",name,commanddefault)
  #system(command,intern = TRUE)

  contentcycle <- data.table::fread("data/full.reads.csv",header=F,sep = ",")
  # remove the 101th column
  contentcycle <- contentcycle[,-c("V101")]
  conn <- dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  dbWriteTable(conn,"contentTableFull",contentcycle, row.names=F)
  myquery <-"select * from contentTableFull"
  content_cycle <-dbGetQuery(conn,myquery)
  return(as.data.frame(content_cycle))
}

