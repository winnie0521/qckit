manual_mean <- function(x){
  quality_mean_sr<-as.vector(colMeans(as.data.frame(x)))
  return(quality_mean_sr)
}

