test_that("Test median",{

  test_result <- expect_equal(seq_median("Data/full.fq.gz")[1],32)
  test_result <- expect_equal(seq_median("Data/full.fq.gz")[3],37)
  return(test_result)
})
