GC_content <- function(name){
  #read the data ShortRead

  fastq <- ShortRead::readFastq(name)
  ##as a sequence content matrix
  contentcycle<-as(ShortRead::sread(fastq), "matrix")
  contentcycle_gc <- rep(0,nrow(contentcycle))



  for (j in 1:nrow(contentcycle)){
    for (i in 1:ncol(contentcycle)){
      if (contentcycle[j,i]=="G"|contentcycle[j,i] == "C")
        contentcycle_gc[j]  = contentcycle_gc[j]+1
    }
  }

  gc <- as.data.frame(contentcycle_gc)
  colnames(gc) = c("meanGC")

  p1 <- ggplot2::ggplot(data=gc, ggplot2::aes(meanGC)) +ggplot2::geom_histogram(breaks=seq(0, ncol(contentcycle), by=1))
  p_GC <- p1 + ggplot2::labs(title = "Histograms for GC content percentage", x= "Mean GC content percentage" , y = "Frequency")
  return(p_GC)
}
