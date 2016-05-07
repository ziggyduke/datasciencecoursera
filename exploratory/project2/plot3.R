library(ggplot2)
if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}
png(filename = "plot3.png", width = 480, height = 480)

par(mfrow = c(1, 1)) 

baltimore <- filter(NEI, fips == "24510")
baltimore <- select(baltimore, Emissions, type, year)
baltimoregroup <- group_by(baltimore, year, type)
baltimoresum <- summarize(baltimoregroup, total_emissions=sum(Emissions))
print(qplot(year, total_emissions, data=baltimoresum, color=type, geom='line', 
            xlab='Year', ylab='PM2.5 Emissions (tons)', main='Baltimore  PM2.5 emissions by source type'))
dev.off()
