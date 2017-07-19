test_that("Test quantiles",{

  expect_equal(seq_quantile("Data/10^5_reads_test.fq.gz",0.5),manual_quantile("Data/10^5_reads_test.fq.gz",0.5))
  expect_equal(seq_quantile("Data/10^5_reads_test.fq.gz",0.25),manual_quantile("Data/10^5_reads_test.fq.gz",0.25))
  expect_equal(seq_quantile("Data/10^5_reads_test.fq.gz",0.75),manual_quantile("Data/10^5_reads_test.fq.gz",0.75))
  expect_equal(seq_quantile("Data/10^5_reads_test.fq.gz",0.9),manual_quantile("Data/10^5_reads_test.fq.gz",0.9))
  expect_equal(seq_quantile("Data/10^5_reads_test.fq.gz",0.1),manual_quantile("Data/10^5_reads_test.fq.gz",0.1))

})
