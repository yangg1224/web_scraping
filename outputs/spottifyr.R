

library(devtools)
#devtools::install_github('charlie86/spotifyr')
library(spotifyr)
library(usethis)
library(tidyverse)

#login
usethis::edit_r_environ() 

#get features
radiohead <- get_artist_audio_features('radiohead')
saveRDS(radiohead, "inputs/radiohead.rds")
radiohead <- readRDS("inputs/radiohead.rds")

names(radiohead)

radiohead %>% 
  select(artist_name, track_name, album_name) %>% 
  head()

#make a quick graph looking at tracj length over time
radiohead %>% 
  ggplot(aes(x = album_release_year, y = duration_ms)) +
  geom_point()


# Spotify provides various information about each track, including ‘valence’, 
#which Spotify define as ‘(a) measure from 0.0 to 1.0 describing the musical positiveness 
#conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful,
# euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).’

swifty <- get_artist_audio_features('taylor swift')
saveRDS(swifty, "inputs/swifty.rds")

The_Chainsmokers  <- get_artist_audio_features('The Chainsmokers ')
saveRDS(The_Chainsmokers, "inputs/The_Chainsmokers.rds")


swifty <- readRDS("inputs/swifty.rds")
The_Chainsmokers <- readRDS("inputs/The_Chainsmokers.rds")

tibble(name = c(swifty$artist_name, radiohead$artist_name,The_Chainsmokers$artist_name),
       year = c(swifty$album_release_year, radiohead$album_release_year, The_Chainsmokers$album_release_year),
       valence = c(swifty$valence, radiohead$valence,The_Chainsmokers$valence)
) %>% 
  ggplot(aes(x = year, y = valence, color = name)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Year",
       y = "Valence",
       color = "Name") +
  scale_color_brewer(palette = "Set1")

# most played artists.
top_artists <- get_my_top_artists_or_tracks(type = 'artists', time_range = 'long_term', limit = 20)

saveRDS(top_artists, "inputs/top_artists.rds")

top_artists <- readRDS("inputs/top_artists.rds")

top_artists %>% 
  select(name, popularity) %>%
  arrange(desc(popularity))
