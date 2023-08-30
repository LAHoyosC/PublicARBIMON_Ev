dt <- read.csv2("Data/Data_graphic.csv")

# dt$Type_Freq_.Hz. <- as.factor(dt$Type_Freq_.Hz.)
# dt$Specie <- as.factor(dt$Specie)
# 
# dt$Spec_Freq <- as.factor(with(dt, paste(Specie, Type_Freq_.Hz., sep="_")))


library(ggplot2)
library(plotly)
library(tidyverse)
library(ggpattern)

names(dt)[names(dt) == 'Specie'] <- 'Species'
dt$Species = as.factor(dt$Species)

#x11()
ggplot(dt, aes(x = Type_Freq_.Hz., y = Freq_.Hz., fill = Species))+
  geom_boxplot(aes()) + xlab("Feature") + ylab("Frequency (Hz)") +
  labs(title = "Frequencies comparison") +
  scale_fill_manual(values = c("#777B7E", "#FFFFFF"),
                    labels = c("N. albicollis", "P. perspicillata"))+
  theme(plot.title = element_text(hjust = 0.5, size = 14),
        axis.title = element_text(size = 15),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12))


ggsave("Frequencies_comparaison.png", width = 6, height = 4, dpi = 300, )

#p <- ggplotly(p)

p




