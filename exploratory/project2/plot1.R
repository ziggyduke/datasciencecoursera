if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}
png(filename = "plot1.png", width = 480, height = 480)

par(mfrow = c(1, 1)) 

select(NEI, Emissions, year) %>%
group_by(year) %>%
summarize(s=sum(Emissions)) %>%
plot(type='o', xlab='Year', ylab='PM2.5 Emissions (tons) ', main="US Total PM2.5 emissions per year")
dev.off()
