# get lyrics for an artist
# devtools::install_github("ewenme/geniusr")
library(geniusr)
library(genius)
library(tidyverse)
geniusr::genius_token()

# get all lyrics from an album
lyrics <- genius::genius_album("Ramones","Leave Home")

tracklist <- geniusr::get_album_tracklist_search(artist_name = "Ramones",
                                                 album_name = "Ramones")
geniusr::get_lyrics_search(artist_name = "Kanye West",
                  song_title = "Good Morning")

ramones_albums <- c(
  "Ramones",
  "Leave Home",
  "Rocket To Russia",
  "Road To Ruin",
  "End Of The Century",
  "Pleasant Dreams",
  "Subterranean Jungle",
  "Too Tough To Die",
  "Animal Boy",
  "Halfway To Sanity",
  "Brain Drain",
  "Mondo Bizarro",
  "Acid Eaters",
  "¡Adios Amigo!"  
)
artist_albums <- ramones_albums %>% 
  enframe(name=NULL,value="album") %>% 
  mutate(artist="Ramones") %>% 
  select(artist,album) %>%
#  filter(album == "Leave Home") %>%
  {.}

ramones_lyrics_genius <- genius::add_genius(artist_albums,artist,album)
