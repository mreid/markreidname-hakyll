---
title: Colophon
---

Colophon
========

_Simplicity_ was my goal when I first decided to build this site for myself. 

I wanted the design to be stripped back but elegant to emphasise the text
and avoid the usual clutter of sidebars and other paraphernalia found on most 
blogs.

I also wanted it to be very easy to host, maintain and update. 
 

The Design
----------

When designing this site I knew I wanted to emulate the many beautifully 
constructed, minimalist web sites I'd encountered over the years. 
In the front of my mind were those by: 
[Jon Tan][jt], [Dean Allen][textism], [Dario Taraborelli][dt], 
[Ryan Tomayko][rt], and [Alex Payne][al3x].

As text is the focus, I had to learn a few things about good typography.
Two resources that helped immensely were
[The Elements of Typographic Style Applied to the Web][ets]
and Mark Boulton's [Five Simple Steps to better typography][fss].
I recommend these to anyone who wants to present stylish, readable web pages.

The main text of this site is set in Palatino with headings in Lucida
Grande.[^1] For those interested in some of the other design tricks used here
you can have a look at the [stylesheet][].

[^1]: This should be the case on Macs. These fonts may not be standard on 
	earlier Windows or Linux machines, in which case Georgia or Times New 
	Roman and the default sans serif fonts are substituted.

[dt]: http://nitens.org/taraborelli/colophon
[rt]: http://tomayko.com/
[al3x]: http://al3x.net/about.html
[jt]: http://jontangerine.com/

[ets]: http://www.webtypography.net/
[fss]: http://www.markboulton.co.uk/articles/detail/five_simple_steps_to_better_typography/
[textism]: http://textism.com/

[stylesheet]: /files/css/screen.css

The Mechanics
-------------

The content of this site begins life as a directory full of text files on my
computer in a format called
[Markdown](http://daringfireball.net/projects/markdown/). 

The stylesheet I use for the site was built with the help of
[CSSEdit](http://macrabbit.com/cssedit/). When I do create diagrams for my
posts these are invariably made with
[OmniGraffle](http://www.omnigroup.com/applications/OmniGraffle/). I push all
of these out to my [GitHub
repository](http://github.com/mreid/mark.reid.name/tree/master) using the
version control system [git](http://code.google.com/p/git-osx-installer/).

To update the site, the text files are first transformed into HTML by
[Pandoc](http://johnmacfarlane.net/pandoc/) with
[MathJax](http://www.mathjax.org) looking after the LaTeX equation rendering.
[Hakyll](http://jaspervdj.be/hakyll/) orchestrates the whole process, adding
headers, navigation bars and the like, creating a directory full of static HTML
ready to be served.  

Finally, I then simply [rsync](http://www.samba.org/rsync/) the newly created
site to my server. 

Licence
-------

Unless specified otherwise, all design and content within this site is licensed
under a <a rel="license"
href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons
Attribution-Noncommercial-Share Alike 3.0 Unported License</a>.

What this means is you are free to use my design and content non-commercially
provided you don't try to pass it off as your own. A simple link back to [my
site](/) with an attribution is enough, like these fine people have done.[^2]

* [Brian McCallister](http://skife.org/about.html)
* [Dumitru Erhan](http://www-etud.iro.umontreal.ca/)
* [Sam Kleinman](http://www.tychoish.com/)
* [Vinod Kurup](http://kurup.org/)
* [Jonathan Buys](http://jonathanbuys.com/)
* [Vinicius Horewicz](http://horewi.cz/)
* [Aladdin Zhang](http://aladdin-z.com/)
* [Thomas Sutton](http://passingcuriosity.com/)
* [Jennifer Lee](http://www.rue-tuscany.com/)
* [Mark Betnel](http://markbetnel.com/)
* [Richard Mortier](http://www.cs.nott.ac.uk/~rmm/)
* [Will Clarkson](http://www.cs.princeton.edu/~wclarkso/)
* [Yuri Kashikov](http://www.kashnikov.com/)
* [Cardcaptor](http://lab.moekaku.com/)
* [Xiao Meng](http://www.cs.sfu.ca/~xiaom/personal/)
* [Moritz Angermann](http://moritzangermann.com/)
* [Chris Toomey](http://www.ctoomey.com/)
* [Stuart Allen](http://users.cs.cf.ac.uk/Stuart.M.Allen/)
* [Daniel Ice](http://coderguy.com)
* [Piotr Kaźmierczak](http://soundandcomplete.com/)
* [Dominik Bruhn](http://www.dbruhn.de/)

I was recently pleased to discover that my design was included in the 
[jekyll bootstrap](http://jekyllbootstrap.com/) project as one of the themes.

If you also use some of my stuff [let me know](mailto:mark@reid.name) and I'll
add you to this list.

[^2]: Some people may have since changed their design, I don't keep track
	on a regular basis.