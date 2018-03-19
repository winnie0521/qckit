testthat::test_that("read_adapters correctly identifies number of adapters", {
  testthat::expect_true(file.exists(file.path(system.file("extdata",package="qckit"),"contaminants.txt")))
  testthat::expect_equal(nrow(read_adapters(file.path(system.file("extdata",package="qckit"),"contaminants.txt"))),5)
  testthat::expect_error(read_adapters(""))
})

testthat::test_that("a vector in the adapter_content map has the same length as
                    the per-position coverage count vector", {

                    })

testthat::test_that("the adapter_content map has as many entries as the number
                    of adapters", {})
