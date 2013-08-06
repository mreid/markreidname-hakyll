---
title: Home
---

Thoughts on Machine Learning and Inference
==========================================

_Inductio Ex Machina_ is [Mark Reid](/)'s research blog on machine 
learning and statistics. 

More [information](info.html) about this blog, its [kith](kith.html) (blogroll, 
bookmarks, _etc._), and a complete archive of [past](past.html) posts, are 
available via links at the top of the page.

You can also subscribe to an [atom feed][] of the most recent posts.

[atom feed]: /blog/atom.xml

<a href="/blog/atom.xml"><img src="/pics/rss.png" alt="Atom Feed" style="height: 2em; margin-right:2.5em;" class="right"/></a>

Recent Posts
------------

$for(posts)$
  <div class="section list">

  <h1>$shortdate$</h1>
  
  <p class="line">
	<a class="title" href="$url$">$title$</a>
	<a class="comments" href="$url$#disqus_thread">View Comments</a>
  </p>

  <p class="excerpt">$excerpt$</p>
  </div>
$endfor$

[Older Posts &rarr;](past.html)

