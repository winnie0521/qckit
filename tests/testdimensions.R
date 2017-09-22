test_that("dimensions",{
  expect_equal(dimensions("data/10^5_reads_test.fq.gz","positions"),100)
  expect_equal(dimensions("data/10^5_reads_test.fq.gz","positions"),25000)

})
