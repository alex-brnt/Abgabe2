# Simulation von Shut the Box und Bestimmung der Gewinnwahrscheinlichkeit
# -----------------------------------------------------------------------

# Prüft, ob eine gültige Kombination existiert
# ----------------------------------------------------------
has_valid_combination <- function(open_flaps, target_sum) {
  for (k in 1:length(open_flaps)) {
    combs <- combn(open_flaps, k)
    if (any(colSums(combs) == target_sum)) {
      return(TRUE)
    }
  }
  return(FALSE)
}


# Simuliert ein einzelnes Spiel
# Rückgabewert:
# TRUE  -> Spiel gewonnen (alle Klappen geschlossen)
# FALSE -> Spiel verloren
# ----------------------------------------------------------
simulate_game <- function() {
  
  open_flaps <- 1:12
  
  repeat {
    dice_sum <- sample(1:6, 1) + sample(1:6, 1)
    
    if (!has_valid_combination(open_flaps, dice_sum)) {
      return(FALSE)  # Spiel verloren
    }
    
    # Alle gültigen Kombinationen finden
    valid_combinations <- list()
    
    for (k in 1:length(open_flaps)) {
      combs <- combn(open_flaps, k, simplify = FALSE)
      for (c in combs) {
        if (sum(c) == dice_sum) {
          valid_combinations[[length(valid_combinations) + 1]] <- c
        }
      }
    }
    
    # Zufällige gültige Kombination wählen
    chosen <- sample(valid_combinations, 1)[[1]]
    open_flaps <- setdiff(open_flaps, chosen)
    
    # Gewinnbedingung
    if (length(open_flaps) == 0) {
      return(TRUE)
    }
  }
}


# Monte-Carlo-Simulation
# ----------------------------------------------------------
set.seed(3)

n_simulations <- 10000
wins <- replicate(n_simulations, simulate_game())

# Gewinnwahrscheinlichkeit
win_probability <- mean(wins)
win_probability