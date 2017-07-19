test_that("test sequence content",{
  expect_equal(sequence_content("Data/10^5_reads_test.fq.gz","N"),manual_sequence_content("Data/10^5_reads_test.fq.gz","N"))
  expect_equal(sequence_content("Data/10^5_reads_test.fq.gz","A"),manual_sequence_content("Data/10^5_reads_test.fq.gz","A"))
  expect_equal(sequence_content("Data/10^5_reads_test.fq.gz","C"),manual_sequence_content("Data/10^5_reads_test.fq.gz","C"))
  expect_equal(sequence_content("Data/10^5_reads_test.fq.gz","T"),manual_sequence_content("Data/10^5_reads_test.fq.gz","T"))
  expect_equal(sequence_content("Data/10^5_reads_test.fq.gz","G"),manual_sequence_content("Data/10^5_reads_test.fq.gz","G"))
})

