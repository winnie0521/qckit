test_that("Test median",{

  test_result <- expect_equal(seq_median("Data/10^5_reads_test.fq.gz"),manual_median("Data/10^5_reads_test.fq.gz"))
  return(test_result)
})
