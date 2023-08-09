#devtools::install_github("numbats/olympics")
#install.packages("worldfootballR")
library(worldfootballR)
help(package="worldfootballR")
cups <- c("FIFA Women's World Cup",
          "FIFA World Cup")
df <- load_match_comp_results(comp_name = cups)

men_venues <- df %>%
  filter(Gender=="M") %>%
  select(Venue) %>%
  unique()

women_venues <- df %>%
  filter(Gender=="F") %>%
  select(Venue) %>%
  unique()

both_venues <- intersect(men_venues, women_venues)

df %>%
  filter(Venue %in% both_venues) %>%
  ggplot(aes(x=Venue, y=Attendance, colour=Gender)) +
  geom_point()