#' Generate the data frame that includes percentiles of quality score per position
#' @param infile the object that is the dataframe of the mean, median and quantiles of the FASTQ file from basic statistics function
#' @param writefile the boolean of whether to write output as file
#' @param prefix the string of customized prefix of write-out file
#' @return table of quality score statistics
#' @export
#'
#' @author Wenyue Xing, \email{wenyue_xing@@brown.edu}

basic_stat <- function(infile,writefile=FALSE,prefix){

  basic_stat <- qual_score_per_read(infile)
  if (writefile==TRUE) write.csv(file=paste0(prefix,"basicstat.csv"),basic_stat)
  return(basic_stat)
}
