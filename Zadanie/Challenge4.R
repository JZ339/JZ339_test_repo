# **CHALLENGE 4:** Jakie są najpopularniejsze tagi dla produkcji dostępnych w języku polskim?

library(dplyr)
library(tidyr) # Niezbędna do funkcji separate_rows()

najpopularniejsze_tagi <- dane %>%
  # 1. Filtrujemy po języku (w zbiorach anglojęzycznych polski to "Polish")
  filter(grepl("Polish", Languages)) %>%
  # 2. Rozbijamy złączone tagi na osobne wiersze. 
  # sep = ",\\s*" oznacza podział w miejscu przecinka i ignorowanie ewentualnych spacji
  separate_rows(Tags, sep = ",\\s*") %>%
  # 3. Zliczamy wystąpienia każdego tagu (sort = TRUE od razu układa je malejąco)
  count(Tags, sort = TRUE) %>%
  # 4. Wybieramy np. 5 najpopularniejszych tagów
  head(5) %>%
  # 5. Wyciągamy wektor z samymi nazwami
  pull(Tags)

najpopularniejsze_tagi