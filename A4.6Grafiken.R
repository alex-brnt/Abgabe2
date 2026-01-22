###########################################################################
# Aufgabe 4.6
###########################################################################
library(plotly)

# 3D-Scatterplot
# -------------------------------------------------------------------------
plot_ly(
  data = bikesharingClean,
  x = ~avg_temp_c,
  y = ~windspeed_kmh,
  z = ~count,
  type = "scatter3d",
  mode = "markers",
  marker = list(
    size = 4,
    color = ~count,
    colorscale = "Viridis",
    showscale = TRUE
  )
) %>%
  layout(
    title = "Zusammenhang zwischen Temperatur, Windgeschwindigkeit und Fahrradausleihen",
    scene = list(
      xaxis = list(title = "Mittlere Temperatur (°C)"),
      yaxis = list(title = "Windgeschwindigkeit (km/h)"),
      zaxis = list(title = "Anzahl ausgeliehener Fahrräder")
    )
  )
