#' Read results quality score matrix from gzipped FASTQ file and save the read matrix to SQLite database
#' @param name the object that is the path to gzipped file
#' @importMethodsFrom RSQLite
#' @return data frame obtained by SQLite command from the saved table
#' @example
#' scorecycle("full.fq.gz")


scorecycle <- function(name){
  # write tables to csv files
  #commanddefault <- 'gunzip -c 10^6_reads_test.fq.gz | paste - - - - | cut -f 4 |awk "{split($0, chars, /"/" ) ;for (i=1; i <= length($0); i++) {printf("%s,", chars[i])}; printf("\n")}" > full.qual.csv'
  #command <- sub("10^6_reads_test.fq.gz",name,commanddefault)
  #system(command,intern = TRUE)

  scorecycle <- data.table::fread(name,header=F,sep = ",")

  conn <- dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  dbWriteTable(conn,paste(name,"_score",sep=""),scorecycle, row.names=F)
  #myquery <-"select * from scoreTableFull"
  #scoredata <-dbGetQuery(conn,myquery)
  #score_cycle <- lapply( scoredata, FUN = function(x) {sapply(x, as.numeric(charToRaw(x)))} )
  #return(score_data)
}
