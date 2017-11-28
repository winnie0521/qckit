test_that("GC",{
  #test the dimension of resulting dataset
  expect_equal(nrow(GC_content("Data/10^5_reads_test.fq.gz")),25000)
  expect_that
})
