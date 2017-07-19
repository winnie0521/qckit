test_that("Test Overrepresented Sequence",{

  #test whether the first row(largest counts) matches
  expect_equal(as.vector(overrepresented_sequence("~/Desktop/Rdata/qckit/Data/10^5_reads_test.fq.gz")[1,])," 123 TGGGTGTGAGGAGTTCAGTTATATGTTTGGGATTTTTTAGGTAGTGGGTGTTGAGCTTGAACGCTTTCTTAATTGGTGGCTGCTTTTAGGCCTACTATGG")

})
