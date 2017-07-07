#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

joined_data <- left_join(NEI, SCC, by = "SCC")

coal <- grepl("..Coal", joined_data$Short.Name)
coal <- joined_data[coal == TRUE,]

plot4data <- tapply(coal$Emissions, coal$year, sum)

png(filename = paste0(getwd(),"/plot4.png"))
plot4 <- barplot(plot4data, main = "Coal Emissions by Year",
                 ylab = "Total Emissions",
                 xlab = "Year")
dev.off()