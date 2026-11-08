# **CHALLENGE 5:** Jakie są średnie oceny filmów wyprodukowanych w poszczególnych dekadach (tzn. lata 60, 70, 80, 90 etc.)?

library(dplyr)

srednie_oceny_dekady <- dane %>%
  # 1. Bierzemy pod uwagę tylko filmy, odrzucając seriale
  filter(Series.or.Movie == "Movie") %>%
  # 2. Konwersja daty i wyciągnięcie dekady
  mutate(
    prawdziwa_data = as.Date(Release.Date, format = '%m/%d/%Y'),
    rok = as.numeric(format(prawdziwa_data, "%Y")),
    # Operator %% to reszta z dzielenia. 1987 %% 10 daje 7. 1987 - 7 = 1980.
    dekada = rok - (rok %% 10) 
  ) %>%
  # 3. Pozbywamy się wierszy bez daty, żeby nie stworzyć grupy "NA"
  filter(!is.na(dekada)) %>%
  # 4. Grupujemy dane według naszej nowej kolumny "dekada"
  group_by(dekada) %>%
  # 5. Obliczamy średnią ocen z IMDb dla każdej z tych grup
  summarise(srednia_ocena = mean(IMDb.Score, na.rm = TRUE)) %>%
  # 6. Sortujemy chronologicznie
  arrange(dekada)

srednie_oceny_dekady