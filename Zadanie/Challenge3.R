# **CHALLENGE 3:** Dla produkcji z lat 2019 oraz 2020 jaki jest średni czas między premierą a pojawieniem się na Netflixie?

library(dplyr)

sredni_czas <- dane %>%
  # 1. Konwersja obu kolumn na poprawny format daty
  mutate(
    data_premiery = as.Date(Release.Date, format = '%m/%d/%Y'),
    data_netflix = as.Date(Netflix.Release.Date, format = '%m/%d/%Y')
  ) %>%
  # 2. Wyciągnięcie samego roku z daty premiery i przefiltrowanie na lata 2019 i 2020
  filter(format(data_premiery, "%Y") %in% c("2019", "2020")) %>%
  # 3. Obliczenie różnicy w dniach między premierą a wejściem na platformę
  mutate(roznica_dni = as.numeric(data_netflix - data_premiery)) %>%
  # 4. Obliczenie średniej (na.rm = TRUE pomija filmy, którym brakuje daty wejścia na Netflix)
  summarise(srednia = mean(roznica_dni, na.rm = TRUE)) %>%
  # 5. Wyciągnięcie samej liczby
  pull(srednia)

sredni_czas