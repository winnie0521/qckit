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
  return(contentcycle_gc)
}
