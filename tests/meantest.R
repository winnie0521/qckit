test_that("Test mean",{

  test_result <- expect_equal(seq_mean("Data/10^5_reads_test.fq.gz"),manual_mean("Data/10^5_reads_test.fq.gz"))
return(test_result)
  })
