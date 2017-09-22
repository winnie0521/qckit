test_that("Test quantiles",{

  basic_statistics <- read.csv("file2_basic_statistics.csv",header=TRUE,row.name=1)
  quality_lowq_sr<-as.vector(as.matrix(basic_statistics["score_q25",]))
  quality_uppq_sr<-as.vector(as.matrix(basic_statistics["score_q75",]))
  quality_10thq_sr<-as.vector(as.matrix(basic_statistics["score_q10",]))
  quality_90thq_sr<-as.vector(as.matrix(basic_statistics["score_q90",]))

  expect_equal(quality_lowq_sr[1],32)
  expect_equal(quality_uppq_sr[1],32)
  expect_equal(quality_10thq_sr[1],32)
  expect_equal(quality_90thq_sr[1],32)

})
