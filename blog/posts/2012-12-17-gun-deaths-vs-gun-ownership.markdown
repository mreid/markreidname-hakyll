---
title: Gun Deaths vs. Gun Ownership
excerpt: Looking at some data on gun-related deaths and gun ownership worldwide in the wake of the Sandy Hook shooting.
location: Canberra, Australia
---

In the wake of the [tragic shooting][] at Sandy Hook Elementary School there was a flurry of discussion about gun control in my Twitter and Facebook feeds. One statistic from an April 2012 [New Yorker article][] caught my attention:

> The United States is the country with the highest rate of civilian gun ownership 
> in the world. (The second highest is Yemen, where the rate is nevertheless only 
> half that of the U.S.) No civilian population is more powerfully armed.

I posted this quote on Facebook and was asked whether there was any correlation between rates of gun ownership and gun-related deaths. After 20 minutes of grabbing some data on worldwide [gun ownership][] and [gun deaths][] from Wikipedia and running it through [R][] I produced the following graph.

![_Figure 1_: Gun-related deaths per capita vs. gun ownership per capita in OECD countries.](/pics/figures/deaths-vs-guns.png)

<div class="note">
**Update - 19 Dec. 2012**: The above graph was correct for the data I obtained for Wikipedia on the 17th. It has since been updated. See the update at the end of this post for details.
</div>

I posted this graph on Twitter late on Sunday night and woke up this morning to find it had been retweeted over 200 times. In addition, there were a large number of questions and requests for different graphs.

<blockquote class="twitter-tweet tw-align-center"><p>Out of curiosity, I grabbed gun death and gun ownership data for OECD countries from Wikipedia and ran it through R: <a href="https://t.co/hgsOeQzp" title="https://dl.dropbox.com/u/38668/deaths-vs-guns.png">dl.dropbox.com/u/38668/deaths…</a></p>&mdash; Mark Reid (@mdreid) <a href="https://twitter.com/mdreid/status/280269141942878208" data-datetime="2012-12-16T11:12:25+00:00">December 16, 2012</a></blockquote>

<script src="//platform.twitter.com/widgets.js" charset="utf-8">&nbsp;</script>

So that others can analyse the data I used themselves, I thought I would write up how I created the graph.

## The Data

The first step was finding data on gun ownership and gun-related deaths and getting it into R.

A quick search revealed Wikipedia articles on [countries by firearm-related death rate][gun deaths] and [Number of guns per capita by country][gun ownership]. I cut and pasted the tables in these articles into a [text editor][vim] and saved them as CSV files. I also grabbed a [list of OECD countries][] from Wikipedia and converted it. You can grab the resulting files here:

* [deaths.csv](/bits/guns/data/deaths.csv) (as of 17 Dec. 2012)
* [guns.csv](/bits/guns/data/guns.csv) (as of 17 Dec. 2012)
* [oecd.csv](/bits/guns/data/oecd.csv) (as of 17 Dec. 2012)

<div class="note">
**Update - 19 Dec. 2012**: The above data was what was available on Wikipedia when I wrote this post. It has since been changed. See the discussion at the end of this post for details.
</div>

[gun ownership]: http://en.wikipedia.org/wiki/Number_of_guns_per_capita_by_country
[gun deaths]: http://en.wikipedia.org/wiki/List_of_countries_by_firearm-related_death_rate



## The Code

The R code I used to create the plot is given below. It simply reads in the data from the guns and deaths CSV files, merges them, adds a column denoting whether a country is in the OECD, and then plots the results.

	guns <- read.table("data/guns.csv", sep="\t", header=TRUE)
	deaths <- read.table("data/deaths.csv", sep="\t", header=TRUE)
	oecd <- read.table("data/oecd.csv", sep="\t", header=TRUE)

	data <- merge(guns, deaths, by="Country")
	data$OECD <- data$Country %in% oecd$Country

	with(subset(data, data$OECD == TRUE), {
		plot(Deaths ~ Guns,
			main="Gun Deaths vs Gun Ownership",
			xlab="Guns per 100 people",
			ylab="Gun deaths per 100k people",
			xlim=c(0,100)
		);
		text(Guns, Deaths, Country, pos=1)
	})

You can get all the code I used to generate the figures in this post here:

* [guns.R](/bits/guns/guns.R)


## Other Graphs

I was asked a number of good questions about the graph I posted on Twitter. In particular, several people were surprised at the number of gun-related deaths for Switzerland. As the following graph of gun homicides vs. gun ownership shows, most of those deaths are actually suicides.

![_Figure 2_: Gun homicides per capita vs. gun ownership per capita in OECD countries.](/pics/figures/homicide-vs-guns.png)

![_Figure 3_: Detail of gun homicides per capita vs. gun ownership per capita in OECD countries.](/pics/figures/homicide-vs-guns-detail.png)

Finally, here is a plot of homicide vs. ownership across all countries -- not just those in the OECD. The mass of countries in the lower left corner is unreadble but you can see those countries with either high homicide rates or high gun ownership clearly.

![_Figure 4_: Gun homicides per capita vs. gun ownership per capita in all countries.](/pics/figures/homicide-vs-guns-all.png)

Just to be clear, I am not making any claims about the effect of gun ownership on shootings. I just wanted to show how easy it is to use freely available data to help answer reasonable questions about heated political issues like gun control. 

I'll leave you to draw your own conclusions.

## Update (19th Dec. 2012)

The response and attention to these plots -- both positive and negative -- on Twitter, in the comments below, and via email has been a little overwhelming. So much so that my site went down yesterday due to me hitting the (usually sufficient) bandwidth cap my host provides.

### Data Updates

Several people noted that the data I plotted for Switzerland was inconsistent with what was on Wikipedia. If you look at the [edit history](http://en.wikipedia.org/w/index.php?title=List_of_countries_by_firearm-related_death_rate&action=history) for the firearm-related death rate page on Wikipedia you will see that someone updated the Switzerland data late on the 16th of December. Taking into account that Canberra, Australia is GMT+11 this update occurred after I scraped the page for the data I used here.

I have redone the OECD plots with data scraped from the same pages as of 3:30pm on the 19th. You can see the results and get the new data below.

![_Figure 1 (updated)_: Gun-related Deaths vs. Gun Ownership for OECD countries.](/pics/figures/deaths-vs-guns-20121219.png)

![_Figure 2 (updated)_: Gun Homicides vs. Gun Ownership for OECD countries.](/pics/figures/homicide-vs-guns-20121219.png)

The new data is here:

* [guns-20121219.csv](/bits/guns/data/guns-20121219.csv)
* [deaths-20121219.csv](/bits/guns/data/deaths-20121219.csv)


### Other Analyses

A number of people pointed me to analyses they had done of similar data, criticisms of this post, and alternative sources of data. Here is a summary of some of those other contributions:

* [Diego Basch](http://diegobasch.com) redid some of the above plots with [overall homicide data](http://diegobasch.com/homicides-vs-gun-ownership) (not just gun homicide).

* [aphyr](http://aphyr.com) redid one of my plots on a log scale and also [compared gun homicide to income and wealth](http://aphyr.com/posts/261-firearm-homicides-vs-gun-prevalence).

* [Dominikus Baur](https://twitter.com/dominikus) created a more [interactive version](http://do.minik.us/shorts/guns/guns.html) of the above plots using d3.

* [Ryan Rosario](https://twitter.com/DataJunkie) pointed me towards [another analysis](http://globalsociology.com/2012/12/15/on-the-guns-thing-i-would-just-like-to-point-out/) of deaths vs. ownership.

* [finem respice](https://twitter.com/finemrespice) has a [very detailed response](http://www.finemrespice.com/node/120) to this post (and other reporting) that explains why the data I used for Switzerland in my initial graphs was incorrect. 

* [Walter Hickey](http://www.businessinsider.com/author/walter-hickey) at Business Insider [summarised my post](http://www.businessinsider.com/shooting-gun-laws-2012-12). There is a vigorous discussion in the comments there.

* [Lev Reyzin](http://www.levreyzin.com) tweeted some plots of [homicides vs. percentage of gun ownership](https://twitter.com/lreyzin/status/280773248629735424), included one [broken down by US states](https://twitter.com/lreyzin/status/281106705746632704).

* [Tim Raupach](https://twitter.com/cutflat) pointed me towards Nate Silver's [analysis of US gun ownership statistics](http://fivethirtyeight.blogs.nytimes.com/2012/12/18/in-gun-ownership-statistics-partisan-divide-is-sharp/).


### Disclaimer

Finally, in light of some of the more vocal criticism I've received, I feel I should reiterate a few points:

* At no point have I ever claimed that this is even close to a rigorous analysis. In my original tweet and here I have made it clear that I have used data from Wikipedia. Since I thought it was common knowledge that Wikipedia should _never_ be used as a primary source for any kind of real research, I didn't expect people to confuse this post with a serious study.

* I have not attempted to use these plots to draw any kind of conclusion about the relationship between gun ownership and gun deaths. Indeed, I do not think there exists a simple explanation. All I intended to do was attempt to shed some light on a question I was asked about a possible correlation.

* I will not run any kind of statistical test on the above data (e.g., rank correlation coefficients). For any such quantity to be meaningful I would need to assume that the data I collected was much more carefully controlled for. Since I just grabbed it from Wikipedia, this is clearly not a valid assumption.

* I do not intend to create more graphs showing other data or other statistics. Other people (see the links above) have already done so for a variety of alternative data. Also, I realise their are better sources of data out there than Wikipedia. However, as I've said before, my intention was not to do a definitive study but rather show how a readily accessible source (i.e., Wikipedia) can be used to quickly get an overview of a topic.

I will probably not the last person to use Wikipedia for this sort of amateur analysis. Therefore, if you believe the data I have used is incorrect or out of date, I suggest you solve the problem at the source and update (with references) the relevant entries on Wikipedia.

If you have a question about other possible correlations or relationships, feel free to apply the code above to what ever sources of data you think might help answer it. I'd appreciate it if you link to what you find in the comments below.


[tragic shooting]: http://en.wikipedia.org/wiki/Sandy_Hook_Elementary_School_shooting
[new yorker article]: http://www.newyorker.com/reporting/2012/04/23/120423fa_fact_lepore?currentPage=all&mobify=0
[R]: http://www.r-project.org
[deaths-vs-guns]: /pics/figures/deaths-vs-guns.png
[vim]: http://code.google.com/p/macvim/
[list of oecd countries]: http://en.wikipedia.org/wiki/List_of_OECD_countries_by_GDP_per_capita

