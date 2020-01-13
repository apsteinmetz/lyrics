# get lyrics for an artist
library(genius)
library(tidyverse)

#make sure you have this
geniusr::genius_token()

# get all lyrics from an album
#lyrics <- genius::genius_album("Ramones","¡Adios Amigos!")

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
