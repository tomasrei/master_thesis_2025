library(extrafont)
library(showtext)
library(here)
extrafont::loadfonts(device = "win") # run always
library(tidyverse)

# FONTS

font_add(
  family = "New Century Schoolbook",
  regular = here("misc", "new_century_schoolbook", "C059-Roman.ttf"),
  italic  = here("misc", "new_century_schoolbook", "C059-Italic.ttf"),
  bold  = here("misc", "new_century_schoolbook", "C059-Bold.ttf")
)
showtext_auto()


# Parameters
a <- 1.4
b <- -4.75

# Create data
df <- bind_rows(
  tibble(x = seq(0, 2.4, length.out = 100),
         y = (x - a)^2 - 0.95,
         part = "f(x) = (x - 1.4)^2 - 1"),
  tibble(x = seq(2.4001, 5, length.out = 100),
         y = 2 * x + b,
         part = "g(x) = 2x - 4.8")
)

# Plot
df |> 
  ggplot() +
  aes(x = x, y = y) +
  geom_line() +
  labs(title = "A typical J-curve", 
       x = "Drinks per day", 
       y = "Relative risk of some outcome", 
       caption = "Higher values imply greater health risks.") +
  geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
  theme_bw(base_size = 20, base_family = "New Century Schoolbook") +
  # show only y = 1
  scale_y_continuous(breaks = 1) +
  scale_x_continuous(expand = c(0, 0)) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


