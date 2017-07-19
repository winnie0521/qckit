test_that("Test sequence content",{
  expect_equal( sequence_content("Data/10^5_reads_test.fq.gz","g"),manual_sequence_content("Data/10^5_reads_test.fq.gz","g"))
  expect_equal( sequence_content("Data/10^5_reads_test.fq.gz","c"),manual_sequence_content("Data/10^5_reads_test.fq.gz","c"))
  expect_equal( sequence_content("Data/10^5_reads_test.fq.gz","a"),manual_sequence_content("Data/10^5_reads_test.fq.gz","a"))
  expect_equal( sequence_content("Data/10^5_reads_test.fq.gz","t"),manual_sequence_content("Data/10^5_reads_test.fq.gz","t"))
  expect_equal( sequence_content("Data/10^5_reads_test.fq.gz","n"),manual_sequence_content("Data/10^5_reads_test.fq.gz","n"))
})
