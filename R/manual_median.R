manual_median <- function(x){


  quality_median_sr <- apply(x,2,median)
  return(quality_median_sr)
}
