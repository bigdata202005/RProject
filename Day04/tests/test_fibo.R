context("fibonacci series")

# 첫줄에는 해당 파일내 테스트들이 무엇에 대한 테스트인지를
# 명시하기위해 context(“fibonacci series”)를 적는다.

test_that("base case2" , {
  expect_equal (NA, fibo(0))
  expect_equal (1, fibo(1))
})

# test_that("recursion test" , {
#   expect_equal (2, fibo (2))
#   expect_equal (3, fibo (3))
#   expect_equal (5, fibo (4))
# })

test_that("recursion test2" , {
  expect_equal (1, fibo (2))
  expect_equal (2, fibo (3))
  expect_equal (3, fibo (4))
})

