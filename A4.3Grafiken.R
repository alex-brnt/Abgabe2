###########################################################################
# Aufgabe 4.3
###########################################################################
library(ggplot2)

# Regentage
# -------------------------------------------------------------------------
ggplot(
  bikesharingClean[bikesharingClean$precipitation > 0, ],
  aes(x = avg_temp_c, y = count)
) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  expand_limits(y = 0) +
  labs(
    title = "Temperatur und Fahrradausleihen an Regentagen",
    x = "Mittlere Temperatur (°C)",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()


# Regenfreie Tage
# -------------------------------------------------------------------------
ggplot(
  bikesharingClean[bikesharingClean$precipitation == 0, ],
  aes(x = avg_temp_c, y = count)
) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  expand_limits(y = 0) +
  labs(
    title = "Temperatur und Fahrradausleihen an regenfreien Tagen",
    x = "Mittlere Temperatur (°C)",
    y = "Anzahl ausgeliehener Fahrräder"
  ) +
  theme_minimal()
