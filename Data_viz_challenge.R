library(tidyverse)
library(agridat)

# Challenge 14: Visualise agridat dataset, "blackman.wheat". 
# Generate a plot that shows the effect of fertiliser treatment across genotypes (gen) and sites (loc).

blackman <- blackman.wheat

blackman

ggplot(
  data = blackman,                                    # call blackman df into ggplot data
  mapping = aes(x = gen, y = yield, colour = nitro)   # pass variables into mapping aes
  ) +
  geom_point(alpha = 0.5) +                           # add points for nitro observations
  facet_wrap( ~ loc)                                  # separate the figures into separate plots, by loc

########################################
