#' Generate the data frame that includes percentiles of quality score per position
#' @param infile the object that is the dataframe of the mean, median and quantiles of the FASTQ file from basic statistics function
#' @return boxplot of per position quality score distribution
#' @export
#'
#' @author Wenyue Xing, \email{wenyue_xing@@brown.edu}

basic_stat <- function(infile){

  basic_stat <- qual_score_per_read(infile)
  basic_statistics <- data.frame(q01 = basic_stat$q01_per_position,
                                 q25 = basic_stat$q25_per_position,
                                 median = basic_stat$q50_per_position,
                                 q75 = basic_stat$q75_per_position,
                                 q99 = basic_stat$q99_per_position)
  return(basic_statistics)
}
