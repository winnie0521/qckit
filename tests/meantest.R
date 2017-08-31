test_that("Test mean",{

  expect_equal(seq_mean("Data/full.fq.gz")[1],31.4168)
  expect_equal(seq_mean("Data/full.fq.gz")[5],36.6426)
})
