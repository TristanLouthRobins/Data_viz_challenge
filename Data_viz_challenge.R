library(tidyverse)
library(agridat)
library(cowplot) # enables display of multi-panel figures

# Challenge 14: Visualise agridat dataset, "blackman.wheat". 
# Generate a plot that shows the effect of fertiliser treatment across genotypes (gen) and sites (loc).

blackman <- blackman.wheat

blackman

rough_blackman <- ggplot(
  data = blackman,                                    # call blackman df into ggplot data
  mapping = aes(x = gen, y = yield, colour = nitro)   # pass variables into mapping aes
  ) +
  geom_point(alpha = 0.5) +                           # add points for nitro observations
  facet_wrap( ~ loc)                                  # separate the figures into separate plots, by loc

rough_blackman

rough_blackman +
  labs(
    title = "Treatment across Genotypes",
    x = "Loc", 
    y = "Yield",
    color = "Nitro"
  ) +
  theme_bw() + 
  theme(
    strip.background = element_blank(),        # remove the grey background behind loc names
    panel.grid.minor = element_blank(),        # remove the minor gridlines from the axes
    panel.grid.major = element_line(size = 1), # increase the size of the major gridlines to 1
    plot.title = element_text(face = "bold"),   # make the fontface of the title bold
    axis.title = element_text(size = 10, colour = "blue"), # axis titles schunk to size 10 and coloured blue
    legend.position = "bottom"
  )

# PREAPRING PLOTS FOR DISPLAY

# utilising cowplot()

plot1 <- ggplot(blackman, aes(x = type, y = yield)) + geom_point()
plot2 <- ggplot(blackman, aes(x = yield, y = loc)) + geom_boxplot()
plot3 <- ggplot(blackman, aes(x = nitro, y = yield)) + geom_point(alpha = 0.5)
plot4 <- ggplot(blackman, aes(x = loc, y = yield)) + geom_point(alpha = 0.5)

plot_grid(plot1, plot2, plot3, plot4, labels = "AUTO") #combining these plots into one single plot


########################################

# MAIN VIZ CHALLENGE:



# Question 1
# For the Perth station (ID 9225), produce three scatter plots showing the relationship 
# between the maximum temperature and each other measurement recorded (minimum temperature, 
# rainfall and solar exposure).

