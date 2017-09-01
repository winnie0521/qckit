#' plot the mean quality score per read
#' \code{plot_perseq_quality}
#' use SQLite command to calculate row means from qualityscore table
#' use ggplot to plot the mean quality score per read
#' @param nc the object that is the numbe of columns of the FASTQ file
#' @return plot of mean quality score per read
#' @example
#' plot_perseq_quality("full.fq.gz")

plot_perseq_quality <- function(nc){

  conn <- dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  command_part <- paste(paste("V",seq(1:nc),sep=""), collapse="+")
  gcquerydefault <- paste("SELECT (",command_part, ")/",nc," as gc_table FROM scoreTableFull",sep="")
  score_sequence_mean<-(RSQLite::dbGetQuery(conn,gcquerydefault))
  colnames(score_sequence_mean) <- c("sequencemean")

  p1 <- ggplot2::ggplot(data=score_sequence_mean, ggplot2::aes(sequencemean)) +ggplot2::geom_histogram()
  p_perseq_quality <- p1 + ggplot2::labs(title = "Histograms of per sequence mean quality ", x= "Mean Quality Score" , y = "Frequency")
  return(p_perseq_quality)
}
