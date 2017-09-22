test_that("test contentcycle",{
  conn <- RSQLite::dbConnect(RSQLite::SQLite(),"test_file.sqlite")
  list<-RSQLite::dbListTables(conn)
  expect_equal(any(list=="contentTableFull"),TRUE)
})
