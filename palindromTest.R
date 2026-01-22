library(testthat)

test_that("Funktion palindrom erkennt Palindrome korrekt", {
  expect_true(palindrom("rentner"))
  expect_false(palindrom("comet"))
})
