# Jekyll to Hakyll Migration

## Content

### Blog
- Apply Pandoc with smart quotes to title and excerpt fields when building recent posts.
- Rest of IEM and SAP posts @done
- Atom feed @done
	- Render math in Atom feed with MathML

### New
- Set up note section of site
- Port `vita.html`
- Move across old Three Words Long posts
	- Write conversion script from Pivot PHP format to markdown.



## Server
- Set up 301 redirects from `/iem/(.*)` and `/sap/(.*)` to `/blog/$1` @done



## Comments
- Get Disqus to crawl new site to migrate comments @done
  (see <http://markreid.disqus.com/admin/tools/migrate/>)



## Style
- Use HTML5 Boilerplate or Typeplate to improve rhythm 
- Make mobile view more friendly


## Old Content
- Put the following projects from TWL back on site

[ICML Trends][icml]
:	I wrote some ruby scripts to scrape, stem and analyse the last 20
	years of ICML paper titles. Some [interesting trends][icml] turned up. 

[PhD Thesis Template for LyX][lyxthesis]
:	I used the excellent LaTeX front-end [LyX][] to write my PhD dissertation.
	To have the result conform to [UNSW][] standards I wrote a LyX layout that
	adds a UNSW title page, copyright and originality statements as well as
	ensuring that margins, _etc._ are correct. 

[Bibdesk To LyX][bibdesktolyx]
:	To help integrate LyX and the excellent (and free!) Mac OS X BibTeX manager 
	[BibDesk][] I wrote a small amount of AppleScript to push selected 
	citations in the latter to the former.

[icml]: http://threewordslong.com/blog/entry/60/ICML_Trends
[unsw]: http://www.unsw.edu.au/
[lyx]: http://lyx.org
[lyxthesis]: http://threewordslong.com/blog/entry/63/A_LyX_Thesis_Layout_for_UNSW_T
[bibdesktolyx]: http://threewordslong.com/projects/bibdesk_to_lyx
[bibdesk]: http://bibdesk.sourceforge.net/
