---
title: ICML Discuss Redux
excerpt: The ICML discussion site rides again, this time integrated into the conference site itself.
location: Canberra, Australia
---

Since 2008, in [one form][2008] or [another][2010], I have experimented with building a discussion site for the ICML conference. The aim has always been to allow people to ask questions about each of the papers accepted to ICML in a given year.

I'm happy to say that, thanks to [John Langford][john]'s encouragement, this year the discussion site is now part of the new and ongoing [ICML site](http://icml.cc). Over time, we plan to improve the integration between the discussion pages and the rest of the site.

For (an admittedly biased) example of what the new set up looks like, you can see what people are saying about my three papers:

- [The Convexity and Design of Composite Multiclass Losses][loss] (with Bob Williamson and Peng Sun)

- [AOSO-LogitBoost: Adaptive One-Vs-One LogitBoost for Multi-Class Problems][aoso] (with Peng Sun and Jie Zhou)

- [Tighter Variational Representations of f-Divergences via Restriction to Probability Measures][fdiv] (with Avraham Ruderman, Darîo Garcîa-Garcîa, and James Petterson)

If you had used the [previous incarnation][2010] of ICML Discuss you will notice that the design is more or less the same and the commenting is still handled by [Disqus][]. There are, however, three main differences (aside from it being hosted at [icml.cc](http://icml.cc)):

## Author notification is opt-out instead of opt-in 

Previously, authors of a paper had to manually sign up to receive an email when someone commented on their paper. This year, I've used a bit of Javascript and PHP trickery to notify all the authors of a paper whenever someone comments. 

The hope is that most authors would prefer to know if someone is reading and asking about their work and that this approach will improve the overall value of the site. Of course, the email that is sent to authors has a prominent link allow him or her to immediately unsubscribe.

## Equations work in abstracts and comments

This year, I also managed to figure out how to set up [MathJax][] on the site so that it renders LaTeX equations both in the abstract text **and** in the comments. Any text in a comment that appears between a pair of `$` symbols or `\[` and `\]` will be rendered as inline or display LaTeX, respectively.

I am quite proud of this hack as it involved some messing about with Disqus's post-comment Javascript hooks and the MathJax [processing model][].

## Twitter "reactions" are enabled

If you use Twitter (like [I do][me]) you can now tweet a link to an ICML Discussion page for a paper, and through the magic of referrer logs, Disqus will notice and include a link to the tweet on the paper's page. 

See the bottom of [this page][fdiv] for an example.

## Other, behind-the-scenes changes

Although it is not apparent from interacting with the site, there was a substantial amount of work involved in moving the system over from its previous entanglement with Google AppEngine and its APIs to the current version. 

## Future Plans

Once it is in a slightly better state (i.e., with some proper documentation) I plan to release the site's code on GitHub. Since the hosting requirements for the discussion site are minimal -- it mainly serves static HTML -- I am hoping other conferences might want to use it. 

I also plan to eventually move comments and papers from the previous two years into the current site. Fortunately, the previous years' comments were also run through Disqus and they provide some nice tools for such a migration.

Finally, once they have ironed some of the bugs, I will move the comments over to Disqus's new style of comment widget which gives a much nicer overview of top commenters, popular pages, and more.

I encourage you to find your favourite papers (or [authors][]) and start commenting. If you have any questions or suggestions, please leave them here, on the [ICML Discuss feedback page][feedback], or catch me in Edinburgh at ICML.

Happy discussing!

[2008]: http://conflate.net/icml/
[2010]: http://mldiscuss.appspot.com/
[disqus]: http://disqus.com/
[mathjax]: http://www.mathjax.com/
[processing model]: http://www.mathjax.org/docs/2.0/model.html
[me]: http://twitter.com/mdreid
[fdiv]: http://icml.cc/discuss/2012/361.html
[aoso]: http://icml.cc/discuss/2012/569.html
[loss]: http://icml.cc/discuss/2012/367.html
[john]: http://hunch.net/
[feedback]: http://icml.cc/discuss/feedback.html
[authors]: http://icml.cc/discuss/author/
