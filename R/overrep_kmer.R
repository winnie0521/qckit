#' Generate overrepresented kmers from all kmer counts results
#' @param path the path to the gz file
#' @param k the length of the sequence looking for
#' @param nc number of positions
#' @param nr number of reads
#' @return the index of reads that has overrepresented kmers
#'
overrep_kmer <- function(path,k,nc,nr){
  fseq <- seqTools::fastqq(path)
  fseq_count <- data.frame(seqTools::fastqKmerLocs(path,k)[[1]])
  colnames(fseq_count) <- seq(1,nc-k+1,1)

  # find marginal probabilities of ATGC

  probA <- sum(sequence_content(fseq,"A"))/nr/nc
  probG <- sum(sequence_content(fseq,"G"))/nr/nc
  probC <- sum(sequence_content(fseq,"C"))/nr/nc
  probT <- sum(sequence_content(fseq,"T"))/nr/nc

  fseq_count$total = rowSums(fseq_count)
  fseq_count$kmer = rownames(fseq_count)

  #find the number of A, T, G, C in each kmer

  for (i in 1:nrow(fseq_count)){

    if (grepl("A",rownames(fseq_count[i,])) ==TRUE){
      fseq_count$counta[i] <- length(gregexpr("A",rownames(fseq_count[i,]))[[1]])
    }else {
      fseq_count$counta[i] = 0
    }

    if (grepl("G",rownames(fseq_count[i,])) ==TRUE){
      fseq_count$countg[i] <- length(gregexpr("G",rownames(fseq_count[i,]))[[1]])
    }else {
      fseq_count$countg[i] = 0
    }
    if (grepl("T",rownames(fseq_count[i,])) ==TRUE){
      fseq_count$countt[i] <- length(gregexpr("T",rownames(fseq_count[i,]))[[1]])
    }else {
      fseq_count$countt[i] = 0
    }
    if (grepl("C",rownames(fseq_count[i,])) ==TRUE){
      fseq_count$countc[i] <- length(gregexpr("C",rownames(fseq_count[i,]))[[1]])
    }else {
      fseq_count$countc[i] = 0
    }

  }

  #calculate expecte kmer per read
  fseq_count$expected <- ((probA^fseq_count$counta)*(probG^fseq_count$countg)*(probC^fseq_count$countc)*(probT^fseq_count$countt))*nr

  fseq_count_copy <- subset(fseq_count,select = -c(counta,countg,countt,countc))

  # calculate an log2(obs/exp) as indicator for further analysis

  for (i in 1:(nc-k+1)){
    fseq_count_copy[,i] = log2(fseq_count_copy[,i]/fseq_count_copy$expected)
  }

  #coalesce into a long vector, find the index of large value and detect the kmer they belong to
  fseq_count_vector <- as.vector(as.matrix(subset(fseq_count_copy,select = -c(total,expected,kmer))))
  index <- which(fseq_count_vector>6)
  value <- fseq_count_vector[which(fseq_count_vector>6)]
  #empty data frame
  indexes <- data.frame(matrix(ncol=3,nrow = length(index)))
  indexes$originalindex <- index
  indexes$obsexp <- value
  indexes$positionindex <- index%%(nc-k+1)
  indexes$kmerindex <- rownames(fseq_count_copy)[index%/%(nc-k+1)+1*(indexes$positionindex!=0)]
  indexes = subset(indexes,select = -c(X1,X2,X3))
  write.csv(file="OverrepresentedKmers.csv",indexes)
  return(indexes)
}
