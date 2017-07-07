#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

Baltimore <- subset(NEI, fips == "24510")
LosAngeles <- subset(NEI, fips == "06037")

citydata <- rbind(Baltimore, LosAngeles)

joined_data <- left_join(citydata, SCC, by = "SCC")

vehicle <- grepl("..Vehicle", joined_data$EI.Sector)
vehicle <- joined_data[vehicle == TRUE,]

plot6data <- vehicle %>%
  group_by(fips, year) %>%
  summarise(sum(Emissions))

colnames(plot6data)[3] <- "Emissions"

png(filename = paste0(getwd(),"/plot6.png"))
ggplot(data = plot6data, aes(x=year, y=Emissions, group=fips, colour=fips)) + 
  geom_line()
dev.off()
