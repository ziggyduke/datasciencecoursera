if (!exists("NEI") | !exists("SCC"))
{
  source("get_data.R")
}

png(filename = "plot2.png", width = 480, height = 480)

par(mfrow = c(1, 1)) 

filter(NEI, fips == "24510") %>%
select(Emissions, year) %>%
group_by(year) %>%
summarize(total_emissions=sum(Emissions)) %>%
plot(type='o', ylab='PM2.5 Emissions (tons)', xlab='Year', main='Total PM2.5 emissions in Baltimore')
dev.off()
