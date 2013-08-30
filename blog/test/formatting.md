---
title: This is a “Test” blog post.
excerpt: A post that works out all of the formatting options and provides a record of how to add figures, quotes, etc.
location: Canberra, Australia
date: 2013-08-28
---


## Figures 

Figures are handled in one of two ways. The first way is to use Pandoc's shorthand:

![_Figure 1_: This is a Pandoc figure.](/pics/ada.jpg)

I also sometimes use description lists with class `figure` to display figures.
The `dd` element holds the image and captions are contained inside 
`<dt><p> ... </p></dt>` blocks.

<dl class="figure">
	<dd>![Alt. text](/pics/ada.jpg)</dd>
	<dt><p>_Figure 1 (alt)_: This is a description list figure.</p></dt>
</dl>

The second option allows more flexibility since the images can be made into links, 
and multiple images can be added to the same figure.

### No Stretching

By default, figures are stretched to 95% of the text width. This can be suppressed
by surrounding the figure in a `div` with class `nostretch`:

<div class="nostretch">

![_Figure 1_: This is a Pandoc figure.](/pics/ada.jpg)

</div>

(Note: I have not fugured out how to centre unstretched figures)

## Tables

Here is a table created using Pandoc's simple table style:

-------------- ----- ------ -------- -------- -------- --- ---
  **Language**  C++   Java   Matlab   Octave   Python   C   R
     **Count**   15    13      11       10        9     5   4
-------------- ----- ------ -------- -------- -------- --- ---

: _Table 1_: Frequency of languages used in MLOSS projects.

<div class="note">Note: Table and Figure captions have italicised titles.</div>

## Other Gotchas

- Do not use straight quotes `"` in the metadata (e.g., `title`, `excerpt`) as these will break the Disqus script.
