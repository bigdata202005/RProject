context("nm_sum test")
# n~m까지의 합을 구하는 함수 테스트
test_that("nm_sum test" , {
  expect_equal (55, nm_sum(1,10))
  expect_equal (55, nm_sum(10,1))
  expect_equal (10, nm_sum(10,10))
})
