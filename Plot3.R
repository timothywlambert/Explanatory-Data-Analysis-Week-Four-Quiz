#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)

Baltimore <- subset(NEI, fips == "24510")

plot3data <- Baltimore %>%
  group_by(type, year) %>%
  summarise(sum(Emissions))

colnames(plot3data)[3] <- "Emissions"

png(filename = paste0(getwd(),"/plot3.png"))
ggplot(data = plot3data, aes(x=year, y=Emissions, group=type, colour=type)) + 
  geom_line()
dev.off()