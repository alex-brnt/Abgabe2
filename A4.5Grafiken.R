###########################################################################
# Aufgabe 4.5
###########################################################################
library(ggplot2)

# Jahreszeiten erzeugen
# -----------------------------------------------------------------------
bikesharingClean$season <- ifelse(
  bikesharingClean$month_of_year %in% c(3, 4, 5), "Frühling",
  ifelse(
    bikesharingClean$month_of_year %in% c(6, 7, 8), "Sommer",
    ifelse(
      bikesharingClean$month_of_year %in% c(9, 10, 11), "Herbst",
      "Winter"
    )
  )
)

# Sinnvolle Reihenfolge
bikesharingClean$season <- factor(
  bikesharingClean$season,
  levels = c("Frühling", "Sommer", "Herbst", "Winter")
)


# Fahrradausleihen nach Jahreszeit
# -------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = count, fill = season)) +
  geom_density(alpha = 0.4) +
  expand_limits(x = 0) +
  labs(
    title = "Verteilung der Fahrradausleihen nach Jahreszeit",
    x = "Anzahl ausgeliehener Fahrräder",
    y = "Dichte",
    fill = "Jahreszeit"
  ) +
  theme_minimal()
