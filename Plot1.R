#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plot1data <- tapply(NEI$Emissions, NEI$year, sum)

png(filename = paste0(getwd(),"/plot1.png"))
barplot(plot1data, main = "Emissions by Year",
                 ylab = "Total Emissions",
                 xlab = "Year")
dev.off()