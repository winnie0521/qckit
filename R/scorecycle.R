#' Read results quality score matrix from gzipped FASTQ file and save the read matrix to SQLite database
#' @param title the tile entered during reading the data, also the title of csv file
#' @importMethodsFrom RSQLite
#' @return data frame obtained by SQLite command from the saved table
#' @example
#' scorecycle("full.fq.gz")


scorecycle <- function(title){
  file_path <- sub("all_reads",title,"all_reads.qual.num.csv")
  scorecycle <- data.table::fread(file_path,header=F,sep = ",")
  conn <- RSQLite::dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  RSQLite::dbWriteTable(conn,"scoreTableFull",scorecycle, row.names=F)
  RSQLite::dbDisconnect(conn)

}
