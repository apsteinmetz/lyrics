# get lyrics for an artist
# devtools::install_github("ewenme/geniusr")
library(geniusr)
library(genius)
library(tidyverse)
geniusr::genius_token()

# get all lyrics from an album
lyrics <- genius::genius_album("Ramones","¡Adios Amigos!")

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
  "¡Adios Amigos!"  
)
artist_albums <- ramones_albums %>% 
  enframe(name=NULL,value="album") %>% 
  mutate(artist="Ramones") %>% 
  select(artist,album) %>%
  {.}

ramones_lyrics_genius <- genius::add_genius(artist_albums,artist,album)
save(ramones_lyrics_genius,file="data/ramones_lyrics_genius.rdata")
