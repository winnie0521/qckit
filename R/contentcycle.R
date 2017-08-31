#' Read results nucletoide sequence content matrix from gzipped FASTQ file and save the read matrix to SQLite database
#' @param name the object that is the path to the csv file
#' @importMethodsFrom RSQLite
#' @return data frame obtained by SQLite command from the saved table
#' @example
#' contentcycle("full.fq.gz")




contentcycle <- function(){
  contentcycle <- data.table::fread("all_reads.seq.csv",header=F,sep = ",")
  conn <- dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  RSQLite::dbWriteTable(conn,"contentTableFull",contentcycle, row.names=F)
  RSQLite::dbDisconnect(conn)
}

