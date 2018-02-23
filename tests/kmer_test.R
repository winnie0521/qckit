test_that("Test kmer",{

  kmer<-seqTools::fastqKmerLocs("Data/10^5_reads_test.fq.gz",k=6)
  #check the dimension of the kmer count
  expect_equal(dim(kmer[[1]]),c(4096,95))
  #check the kmer sequence
  expect_equal(rownames(kmer[[1]])[1:4],c("AAAAAA","AAAAAC","AAAAAG","AAAAAT"))

})
