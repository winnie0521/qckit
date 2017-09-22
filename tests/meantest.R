test_that("Test mean",{
  basic_statistics <- read.csv("file2_basic_statistics.csv",header=TRUE,row.name=1)
  quality_mean_sr<-as.vector(as.matrix(basic_statistics["score_mean",]))
  expect_equal(quality_mean_sr[1],31.6704255759915)
  expect_equal(quality_mean_sr[5],36.6971390522758)
})
