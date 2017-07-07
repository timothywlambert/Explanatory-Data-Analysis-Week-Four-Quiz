#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)

Baltimore <- subset(NEI, fips == "24510")

joined_data <- left_join(Baltimore, SCC, by = "SCC")

vehicle <- grepl("..Vehicle", joined_data$EI.Sector)
vehicle <- joined_data[vehicle == TRUE,]

plot5data <- tapply(vehicle$Emissions, vehicle$year, sum)

png(filename = paste0(getwd(),"/plot5.png"))
barplot(plot5data, main = "Baltimore Vehicle Emissions by Year",
                 ylab = "Total Emissions",
                 xlab = "Year")
dev.off()