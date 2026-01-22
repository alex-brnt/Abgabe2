###########################################################################
# Aufgabe 4.4
###########################################################################
library(ggplot2)

# Ausgeliehene Fahrräder
# -------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = count)) +
  geom_histogram(bins = 30, color = "black", fill = "grey70") +
  expand_limits(x = 0) +
  labs(
    title = "Verteilung der Anzahl ausgeliehener Fahrräder",
    x = "Anzahl ausgeliehener Fahrräder",
    y = "Häufigkeit"
  ) +
  theme_minimal()


# Temperatur
# -------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = avg_temp_c)) +
  geom_histogram(bins = 30, color = "black", fill = "grey70") +
  labs(
    title = "Verteilung der mittleren Temperatur",
    x = "Mittlere Temperatur (°C)",
    y = "Häufigkeit"
  ) +
  theme_minimal()


# Niederschlag
# -------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = precipitation)) +
  geom_histogram(bins = 30, color = "black", fill = "grey70") +
  expand_limits(x = 0) +
  labs(
    title = "Verteilung der Niederschlagsmenge",
    x = "Niederschlagsmenge",
    y = "Häufigkeit"
  ) +
  theme_minimal()


# Windgeschwindigkeit
# -------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = windspeed_kmh)) +
  geom_histogram(bins = 30, color = "black", fill = "grey70") +
  expand_limits(x = 0) +
  labs(
    title = "Verteilung der Windgeschwindigkeit",
    x = "Windgeschwindigkeit (km/h)",
    y = "Häufigkeit"
  ) +
  theme_minimal()
