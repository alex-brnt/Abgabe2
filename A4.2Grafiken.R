###########################################################################
# Aufgabe 4.2
###########################################################################
library(ggplot2)

# Umrechnung von Fahrenheit in Celsius
bikesharingClean$avg_temp_c <-
  (bikesharingClean$average_temperature - 32) * 5 / 9

# Umrechnung von mph zu km/h
bikesharingClean$windspeed_kmh <- bikesharingClean$windspeed * 1.609


# Mittlere Temperatur
#--------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = avg_temp_c, y = count)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  expand_limits(y = 0) +
  labs(
    title = "Zusammenhang zwischen mittlerer Temperatur und Fahrradausleihen",
    x = "Mittlere Temperatur (°C)",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()


# Niederschlagsmenge
# ------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = precipitation, y = count)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  expand_limits(y = 0) +
  labs(
    title = "Zusammenhang zwischen Niederschlagsmenge und Fahrradausleihen",
    x = "Niederschlagsmenge",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()


# Windgeschwindigkeit
# ------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = windspeed_kmh, y = count)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  expand_limits(y = 0) +
  labs(
    title = "Zusammenhang zwischen Windgeschwindigkeit und Fahrradausleihen",
    x = "Windgeschwindigkeit (km/h)",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()


# Tag des Jahres
# ------------------------------------------------------------------------
ggplot(bikesharingClean, aes(x = day_of_year, y = count)) +
  geom_line(alpha = 0.7) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  labs(
    title = "Zeitlicher Verlauf der Fahrradausleihen im Jahresverlauf",
    x = "Tag des Jahres",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()


