guns <- read.table("data/guns.csv", sep="\t", header=TRUE)
deaths <- read.table("data/deaths.csv", sep="\t", header=TRUE)
oecd <- read.table("data/oecd.csv", sep="\t", header=TRUE)

data <- merge(guns, deaths, by="Country")
data$OECD <- data$Country %in% oecd$Country

# Plot all gun-related deaths vs. gun ownership for OECD countries 
with(subset(data, data$OECD == TRUE), {
	plot(Deaths ~ Guns,
		main="Gun Deaths vs Gun Ownership (OECD)",
		xlab="Guns per 100 people",
		ylab="Gun deaths per 100k people",
		xlim=c(0,100)
	);
	text(Guns, Deaths, Country, pos=1)
})

# Plot all gun homicides vs. gun ownership for OECD countries 
with(subset(data, data$OECD == TRUE), {
	plot(Homicides ~ Guns,
		main="Gun Homicides vs Gun Ownership (OECD)",
		xlab="Guns per 100 people",
		ylab="Gun homicides per 100k people",
		xlim=c(0,100)
	);
	text(Guns, Homicides, Country, pos=1)
})

# As above, but zoomed in 
with(subset(data, data$OECD == TRUE), {
	plot(Homicides ~ Guns,
		main="Gun Homicides vs Gun Ownership (OECD)",
		xlab="Guns per 100 people",
		ylab="Gun homicides per 100k people",
		xlim=c(0,50),
		ylim=c(0,2)
	);
	text(Guns, Homicides, Country, pos=1)
})

# Plot all gun homicides vs. gun ownership for all countries 
with(data, {
	plot(Homicides ~ Guns,
		main="Gun Homicides vs Gun Ownership",
		xlab="Guns per 100 people",
		ylab="Gun homicides per 100k people",
		xlim=c(0,100)
	);
	text(Guns, Homicides, Country, pos=1)
})
