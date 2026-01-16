# Datensatz einlesen
# ----------------------------------------------------------
bikesharing <- read.csv(
  file = "bikeshare.csv",   # Pfad zur CSV-Datei
  header = TRUE,            # Datei enthält Kopfzeile
  sep = ",",                # Trennzeichen
  dec = "."                 # Dezimaltrennzeichen
)


# Datensatz nach Station filtern
# ----------------------------------------------------------
bikesharing_station <- bikesharing[
  bikesharing$station == "Stanton St & Chrystie St", 
]

# Auf fehlende Werte Prüfen
colSums(is.na(bikesharing_station))


# Nach Datum sortieren
# ----------------------------------------------------------
bikesharing_station <- bikesharing_station[
  order(bikesharing_station$date),
]


# Kopie des Datensatzes
# ----------------------------------------------------------
bikesharingClean <- bikesharing_station

# Anzahl der Zeilen bestimmen
countZeilen <- nrow(bikesharingClean)

# Imputation: Mittelwert der vorherigen und nachfolgenden Zeile (ohne Randwerte)
# ------------------------------------------------------------------------------
for (j in 1:ncol(bikesharingClean)) {
  
  # Nur numerische Spalten bearbeiten
  if (is.numeric(bikesharingClean[, j])) {
    
    # Über alle Zeilen außer der ersten und letzten iterieren
    for (i in 2:(countZeilen - 1)) {
      
      # Wenn ein fehlender Wert vorliegt
      if (is.na(bikesharingClean[i, j])) {
        
        # Ersetzen durch Mittelwert der Nachbarzeilen
        bikesharingClean[i, j] <-
          (bikesharingClean[i - 1, j] + bikesharingClean[i + 1, j]) / 2
      }
    }
  }
}


# Behandlung von Randwerten (erste und letzte Zeile)
# ----------------------------------------------------------
for (j in 1:ncol(bikesharingClean)) {
  
  if (is.numeric(bikesharingClean[, j])) {
    
    # Erste Zeile
    if (is.na(bikesharingClean[1, j])) {
      bikesharingClean[1, j] <- bikesharingClean[2, j]
    }
    
    # Letztes Zeile
    if (is.na(bikesharingClean[countZeilen, j])) {
      bikesharingClean[countZeilen, j] <-
        bikesharingClean[countZeilen - 1, j]
    }
  }
}

# Auf fehlende Werte nach Imputation prüfen
# ----------------------------------------------------------
colSums(is.na(bikesharingClean))


# Prüfen auf Datenanomalien
# ----------------------------------------------------------
summary(bikesharingClean)

# Bestimmen des Monats, in dem die meisten Fahrräder ausgeliehen wurden
#-------------------------------------------------------------------------

# Gesamtanzahl der ausgeliehenen Fahrräder pro Monat berechnen
ausleihen_pro_monat <- aggregate(
  count ~ month_of_year,
  data = bikesharingClean,
  sum
)

# Monat mit der höchsten Gesamtanzahl an Ausleihen
ausleihen_pro_monat[
  which.max(ausleihen_pro_monat$count),
]




