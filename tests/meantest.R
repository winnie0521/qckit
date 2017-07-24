test_that("Test mean",{

  expect_equal(seq_mean("Data/10^5_reads_test.fq.gz"),manual_mean("Data/10^5_reads_test.fq.gz"))
})
