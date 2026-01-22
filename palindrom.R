# Zweck: Prüft, ob der übergebene String ein Palindrom ist.
#
# Rückgabewert:
# TRUE  -> s ist ein Palindrom
# FALSE -> s ist kein Palindrom
# ----------------------------------------------------------
palindrom <- function(s) {
  stopifnot(is.character(s), length(s) == 1)
  
  chars <- strsplit(s, split = "")[[1]]
  identical(chars, rev(chars))
}

# Beispiele zur Überprüfung
palindrom("regallager")
palindrom("test")
