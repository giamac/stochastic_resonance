library(R.matlab)
library(tidyverse)
library(ggplot2)


signal <- R.matlab::readMat('../noise.mat')[[1]]

hist(signal, breaks = 100)
plot(signal[1:1500], type = 'l')
plot(density(signal))

signal <- as.data.frame(signal[1:1500])
names(signal) <- 'intensity'
signal$time <- 1:(1/150):1500
double_signal <- signal * 2

plot <- signal %>%
  ggplot(aes(x = time, y = intensity)) + 
  geom_line() +
  theme_classic() + 
  geom_hline(yintercept = 0)

ggExtra::ggMarginal(plot, type = 'histogram')
  
