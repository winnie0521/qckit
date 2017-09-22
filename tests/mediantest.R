test_that("Test median",{
  basic_statistics <- read.csv("file2_basic_statistics.csv",header=TRUE,row.name=1)
  quality_median_sr<-as.vector(as.matrix(basic_statistics["score_median",]))
  expect_equal(quality_mean_sr[1],32)
  expect_equal(quality_mean_sr[5],37)
})
