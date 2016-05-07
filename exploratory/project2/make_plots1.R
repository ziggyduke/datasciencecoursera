emiyear <- select(NEI, Emissions, year)
emi_group <- group_by(emiyear, year)
emisum <- summarize(emi_group, s=sum(Emissions))
plot(emisum)