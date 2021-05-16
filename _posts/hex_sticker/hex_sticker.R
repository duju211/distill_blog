# ---- libraries ---------------------------------------------------------------
library(hexSticker)
library(tidyverse)
library(pins)

# ---- alpe_dhuez_act ----------------------------------------------------------
alpe_dhuez_id <- "1714646144"
athlete_id <- "26845822"

board_register_github(repo = "duju211/strava_act", branch = "master")

df_act <- pin_get(
  str_glue("act_{alpe_dhuez_id}_{athlete_id}"), board = "github")

board_disconnect("github")

# ---- gg_act ------------------------------------------------------------------
gg_act <- df_act %>% 
  ggplot(aes(x = lng, y = lat)) +
  geom_path(color = "white") +
  theme_void() +
  theme(legend.position = "none")

# ---- save_result -------------------------------------------------------------
sticker(
  gg_act, package="SummitR", p_size=20, s_x=1.1, s_y=.75, s_width=1.3,
  s_height=1, h_fill = "#fc4c02", h_color = "white",
  filename="_posts/hex_sticker/hex_sticker.png")
