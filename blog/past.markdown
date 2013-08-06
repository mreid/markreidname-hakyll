---
top: Inductio Ex Machina
title: Archives
section: Past
---

# Archives

This is the complete archive of posts from [Inductio Ex Machina](/iem) in 
reverse chronological order.

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
