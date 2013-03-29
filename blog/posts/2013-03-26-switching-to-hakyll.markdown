---
title: Switching from Jekyll to Hakyll
excerpt: A brief operational note on how and why I shifted my site and this blog from Jekyll to Hakyll.
location: Canberra, Australia
---

This is a non-machine learning-related post about a recent change to how I run this blog and the rest of my site. As you will notice, the design and content has largely stayed the same. However, I've made several changes under the hood that will make it easier for me to continue to develop my site.

The biggest change in my set up was shifting from using [Jekyll](https://github.com/mojombo/jekyll) to generate my site to using [Hakyll](http://jaspervdj.be/hakyll/).
I thought I would write up my experiences in case any one else in interested in making this switch.


## Leaving Jekyll

I'll get this out of the way up front: Jekyll is fantastic and I would heartily recommend it to anyone wanting to set up a new statically generated site. It is easy to set up (especially if you use [Octopress](http://octopress.org) or [Jekyll Bootstrap](http://jekyllbootstrap.com)), has an activity community of developers led by the impressive [Tom Preston-Werner](http://tom.preston-werner.com), and you can easily host your site using [Github Pages](http://pages.github.com).

So why make the switch to Hakyll? The main reason is that I am using [Pandoc](http://johnmacfarlane.net/pandoc/) as my main tool for rendering Markdown and wanted my site to do the same. Less crucially: I wanted an excuse to get back into using Haskell.

Yes, there is a [Jekyll plugin for pandoc](https://github.com/dsanson/jekyll-pandoc-plugin) but I wasn't keen on bringing another dependency into my already hard to maintain ruby environment. Also, after a bit of preliminary playing around with Hakyll I noticed it was substantially faster at generating my site than my Jekyll set up.


## Using Hakyll

As the name suggests, Hakyll is inspired by Jekyll but written in Haskell. Both systems are built around the idea of taking a folder full of blog posts written in markdown (or some other human-friendly markup language) and generating HTML by rendering their content and wrapping templates around them.

Jekyll follows the general ruby philosophy of "convention of configuration" and, out of the box, will look for specially named files (e.g., `*.md`) and folders (e.g., `_posts` and `_layouts`) to find the content and templates needed to build you site.

In constrast, Hakyll requires you to write a small Haskell program to describe how you want pages to be rendered using a very flexible "Rules" language. For example, in my [`site.hs`](https://github.com/mreid/markreidname-hakyll/blob/master/site.hs) file I use the following code to set up my CSS files and render and wrap my blog posts.

~~~~ {.haskell}
main = hakyllWith siteConfig $ do
  -- CSS
  match "css/**" $ do
    route   $ idRoute
    compile $ compressCssCompiler

  -- Posts
  match "blog/posts/*" $ do
    route   $ gsubRoute "posts" (const "") `composeRoutes` rmDateRoute
    compile $ blogPostCompiler True
  
-- Blog post compiler
blogPostCompiler snapshot = mathJaxRenderer
  >>= loadAndApplyTemplate "_templates/post/full.html" postCtx
  >>= (if snapshot then (saveSnapshot "content") else return . id)
  >>= loadAndApplyTemplate "_templates/nav/blog.html" postCtx
  >>= loadAndApplyTemplate "_templates/default.html" postCtx
  >>= relativizeUrls

-- Blog context
postCtx =
  dateField "date" "%B %e, %Y" `mappend`
  dateField "shortdate" "%e %b %y" `mappend` 
  constField "top" "Inductio Ex Machina &larr; Mark Reid" `mappend`
  constField "section" "Blog" `mappend`
  defaultContext

-- Take out the post/YYYY-MM-DD part from the post URL
rmDateRoute = 
  gsubRoute "/[0-9]{4}-[0-9]{2}-[0-9]{2}-" (const "/")
  `composeRoutes` setExtension "html"
~~~~

The `route` rule describes how the pattern in the `match` argument is converted into a URL. The `compile` rule describes how the items matching the pattern should be processed to build resource on your site.

In the case of the CSS files, each one is one through a (Hakyll provided) function that compresses the CSS by stripping whitespace.

Each of my blog posts starts life as a text file in my `blog/posts/` directory and has a name of the form `YYYY-MM-DD-title.md`. The `YYYY-MM-DD` part specifies the post's creation date and the title is used to form the URL. The `route` that handles blog posts first strips out the `posts` part from the file's path and removes the data part of the the filename. The `blogPostCompiler` then runs its contents through a Pandoc renderer with MathJax output enabled then runs it through a pipeline that wraps various bits of HTML around it (`div` blocks, navigation elements, and finally `head` and `body` elements).

The blog template I use looks like this:

~~~~ {.html}
<div id="page">

<h1 class="emphnext">$title$</h1>

$body$

<address class="signature">
  <a class="author" href="http://mark.reid.name">Mark Reid</a> 
  <span class="date">$date$</span>
  <span class="location">$location$</span>
</address>

</div>
~~~~

The `$keywords$` in the template specify per-post values that are substituted in. In Hakyll, these are set using "Context" functions. In my case, the `postCtx` function sets the `$date$` keyword in a "Month Day, Year" format and grabs the title and other values from the metadata at the top of each post using Hakyll's built in functions.

As you can see from the above, configuring a Hakyll site boils down to explicitly writing code for how you want things processed. It is certainly more complicated than Jekyll. Fortunately, what Hakyll provides is a great "mini-language" of sorts that takes care of many of the fiddly bits (e.g., reading files, managing dependencies, rendering markdown). Anything that isn't provided by Hakyll you can write yourself using Haskell.

It's the difference between getting a ready-made meal versus buying good ingredients and making it yourself. In the latter case, you can easily stray from a recipe and tweak things to your own taste. 

## Housekeeping: Redirects and Comments

Once I had Hakyll generating my site I had to make a couple of final changes to finish the transition.

The first, and easiest, was remapping some URLs. Because I merged my _Inductio ex Machina_ and _Structure & Process_ blogs, which were previously at `/iem/` and `/sap/` respectively, into a single blog at `/blog/` I had to ensure posts from the old URLs were sent to the new one.

I did this using `RedirectMatch` directives in my `.htaccess` file:

~~~
RedirectMatch 301 ^/iem/(.*)$ /blog/$1
RedirectMatch 301 ^/sap/(.*)$ /blog/$1
~~~

These simply match any post location from the old URLs and map them to the corresponding place under the new scheme. For example, my [Behold! Jensen's Inequality](/blog/behold-jensens-inequality.html) post used to be at `/iem/behold-jensens-inequality.hml` but is now at `/blog/behold-jensens-inequality.hml`. The `301` in the commands above tell any browsers that the posts have "[Moved Permanently](http://en.wikipedia.org/wiki/HTTP_301)".

The other main job I had was migrating my comments over to the new URL scheme. I use [Disqus](http://disqus.com) to host the comments for this site. The way Disqus works means the comments for each post are associated with the URL of that post. Changing the post URLs meant all the comments for the posts were no longer appearing.

Fortunately, Disqus provides an incredibly simple migration tool to solve this problem. Because I had set up the 301 redirects, all I had to do was click a button in Disqus' admin panel for my site to tell its crawlers to go over my site, find the posts which had been 301ed, and update its database accordingly.

It worked like a charm.

Well... except for the Atom/RSS feed I accidentally regenerated with all my posts in it, thereby filling up many people's feed readers with my old posts. Sorry about that.

## Pros and Cons

So was the switch worth it?

For the purpose of regaining some of my Haskell-fu I can definitely say "yes". I struggled quite a bit with remembering various idioms after a 12 year hiatus. Now I feel much more comfortable coding in Haskell and am probably more proficent than when I last did it.

I really like working in Pandoc's style of markdown. It does (almost) everything [Maruku](http://maruku.rubyforge.org/), the previous renderer I used, did but it is much, much faster and has significantly better error reporting. I do miss Maruku's syntax for `div` block, but apart from that I'm much happier with Pandoc.

Writing configuration code in Hakyll is much more time consuming, especially at first. However, given the fairly bespoke nature of my site and the even more arcane changes I have planned, I was already bending Jekyll a lot (through configuration, templates, and hacks) to get it to do what I wanted. Being able to drop down to Haskell and write code to specify how I want pages built is much easier in Hakyll.

That said, the templating in Hakyll is very basic and I had to put a lot more thought into how I wrote them in order to get the results I wanted.

Overall though, I am happy with this new set up and am looking forward to putting more content up on my site again.

