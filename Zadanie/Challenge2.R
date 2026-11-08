#Jakie są trzy najwyżej oceniane komedie dostępne w języku polskim?
library(tidyverse)

challenge2 <- dane %>%
  filter(
    str_detect(Languages, "Polish"),
    str_detect(Genre, "Comedy")
  ) %>%
  arrange(desc(IMDb.Score)) %>%
  select(Title, IMDb.Score, Genre, Languages) %>%
  head(3)

print(challenge2)