# test_that("Test kmer",{
#
#   kmer1_names <- rownames(kmer("~/Desktop/Rdata/qckit/Data/10^5_reads_test.fq.gz",1))
#   kmer1_counts <- kmer("~/Desktop/Rdata/qckit/Data/10^5_reads_test.fq.gz",1)[,1]
#   expect_equal(kmer1_names,c("A","C","G","T"))
#   expect_equal(kmer1_counts,c(717467,468181,536005,777992))
#   kmer2_names <- rownames(kmer("~/Desktop/Rdata/qckit/Data/10^5_reads_test.fq.gz",2))
#   kmer2_counts <- kmer("~/Desktop/Rdata/qckit/Data/10^5_reads_test.fq.gz",2)[,1]
#   expect_equal(kmer2_names,c("AA" ,"AC" ,"AG", "AT", "CA", "CC", "CG", "CT", "GA" ,"GC", "GG", "GT" ,"TA", "TC" ,"TG", "TT"))
#   expect_equal(kmer2_counts,c(242990, 125656, 179207, 161390,124411, 128514 , 38243 ,172412 ,123580, 100560, 154469 ,152301, 221965, 105592 ,157187 ,285813))
# })
