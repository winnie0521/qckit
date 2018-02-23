test_that("Test dimensions",{

  expect_equal(dimensions(seqTools::fastqq("Data/10^5_reads_test.fq.gz"),"reads"),25000)
  expect_equal(dimensions(seqTools::fastqq("Data/10^5_reads_test.fq.gz"),"positions"),100)

})
