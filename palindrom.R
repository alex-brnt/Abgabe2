# Zweck: Prüft, ob der übergebene String ein Palindrom ist.
#
# Rückgabewert:
#   TRUE  -> s ist ein Palindrom
#   FALSE -> s ist kein Palindrom
# ----------------------------------------------------------
palindrom <- function(s) {
  stopifnot(is.character(s), length(s) == 1)
  
  chars <- strsplit(s, split = "")[[1]]
  identical(chars, rev(chars))
}

library(testthat)

test_that("Funktion palindrom erkennt Palindrome korrekt", {
  expect_true(palindrom("rentner"))
  expect_false(palindrom("comet"))
})

# Beispiele zur Überprüfung
palindrom("regallager")
palindrom("test")
