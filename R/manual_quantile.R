manual_quantile <- function(scorecycle,q){

  quality_median_sr <- apply(scorecycle,2,function(x) quantile(x,q))
  return(quality_median_sr)
}
