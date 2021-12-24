data <- read.csv("country_vaccinations.csv")
data[1:10, 1:7]
library(Hmisc)
library(plyr)
describe(data)
count(data$country)
UnitedKingdom <- data$country[!(data$country %in% c("England", "Scotland", "Wales", "Northern Ireland"))]
count(UnitedKingdom)
count(data$vaccines)
vaccinesData <- data[c("vaccines", "country")]
vaccinesData[1:4,]

ggplot() +
  geom_polygon(data = data, aes(x = country, y = vaccines, group = vaccines)) +
  geom_point(data = data, aes(x = country, y = vaccines), color = "#e60000") +
  scale_fill_manual(values = c("#CCCCCC","#e60000")) +
  theme(text = element_text(family = "Gill Sans", color = "#FFFFFF")
        ,panel.background = element_rect(fill = "#444444")
        ,plot.background = element_rect(fill = "#444444")
        ,panel.grid = element_blank()
        ,plot.title = element_text(size = 30)
        ,plot.subtitle = element_text(size = 10)
        ,axis.text = element_blank()
        ,axis.title = element_blank()
        ,axis.ticks = element_blank()
        ,legend.position = "none"
  )
