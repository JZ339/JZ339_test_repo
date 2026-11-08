#  **CHALLENGE 1:** Jaki jest najstarszy film Woody'ego Allena dostępny na Netflixie?
library(dplyr)
 
najstarszy_film <- dane %>%
  # Tworzymy nową kolumnę z poprawnym formatem daty, żeby móc chronologicznie posortować
  mutate(prawdziwa_data = as.Date(Release.Date, format = '%m/%d/%Y')) %>%
  # Dodany warunek: wybieramy wyłącznie produkcje będące filmami
  filter(Series.or.Movie == "Movie") %>%
  # Filtrujemy dane w poszukiwaniu Woody'ego Allena (sprawdzamy reżysera i dla pewności aktorów)
  filter(grepl("Woody Allen", Director) | grepl("Woody Allen", Actors)) %>%
  # Sortujemy od najstarszej daty
  arrange(prawdziwa_data) %>%
  # Bierzemy pierwszy wiersz
  slice(1) %>%
  # Wyciągamy samą nazwę filmu
  pull(Title)

najstarszy_film
