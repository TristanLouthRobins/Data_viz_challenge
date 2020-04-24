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

# MAIN VIZ CHALLENGE: Recall previous BOM challenge (GitHub repo "DS-W02-Reproducibility_challenge")

BOM_data <-  read_csv("data/BOM_data.csv")
BOM_stations <-  read_csv("data/BOM_stations.csv")



# Question 1
# For the Perth station (ID 9225), produce three scatter plots showing the relationship 
# between the maximum temperature and each other measurement recorded (minimum temperature, 
# rainfall and solar exposure).



# Question 2
# Display these four measurements for the Perth station in a single scatter plot by using 
# additional aesthetic mappings.
# You may need to try a few different data/aesthetic mappings to find one you like.



# Question 3
# Take the four plots you have produced in Q1 and Q2 and save them as a multi-panel figure.



# Question 4
# Using the entire BOM dataset, calculate the average monthly rainfall for each station. 
# Produce a lineplot to visualise this data and the state each station is in.

