#Read in Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == "24510")

plot2data <- tapply(Baltimore$Emissions, Baltimore$year, sum)

png(filename = paste0(getwd(),"/plot2.png"))
plot2 <- barplot(plot2data, main = "Baltimore Emissions by Year",
                 ylab = "Total Emissions",
                 xlab = "Year")
dev.off()