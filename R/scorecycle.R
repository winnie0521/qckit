#' Read results quality score matrix from gzipped FASTQ file and save the read matrix to SQLite database
#' @param name the object that is the path to gzipped file
#' @importMethodsFrom RSQLite
#' @return data frame obtained by SQLite command from the saved table
#' @example
#' scorecycle("full.fq.gz")


scorecycle <- function(){

  scorecycle <- data.table::fread("all_reads.qual.num.csv",header=F,sep = ",")
  conn <- RSQLite::dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  RSQLite::dbWriteTable(conn,"scoreTableFull",scorecycle, row.names=F)
  RSQLite::dbDisconnect(conn)

}
