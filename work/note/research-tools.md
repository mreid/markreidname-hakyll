---
title: Research Tools
layout: note
date: 2010-11-15

---
Some brief notes on how I (would like to) manage my research.

I seem to have several ways of collecting and organising what I read and write. I'll start by listing them here and how I currently use them. I'll then attempt to describe how I might use them more effectively.

## BibDesk
Currently, I have a number of shared and personal bibliography files. The biggest is _reductions.bib_ which I share with Bob. I've tried to organise others by rough topic: _risk_, _pac-bayes-transfer_, _map_, _mine_, but I also have one, _summaries_, that I seem to have dumped stuff in to be read in no particular order. 

I have tried using the "Priority", "Read", and "Rating" fields to organise when I should read things. My aim was to work my way through papers, and only marking them as read if I write a short annotation, rate them, and add keywords.

- I think the idea of .bib files per topic is a good one. Entries can be moved to paper-specific bibliographies if needed.
- I would like to continue prioritising papers and annotating them whenever possible. However, demanding that I read all papers is onerous and leads to procrastination. I need to be able to flag papers as not immediately relevant and move on.
- I need to sort out the way I handle attachments. Ideally, I would like to keep Auto-Filed copies in Dropbox. Doing so with papers shared with Bob is tricky though due to pre-existing conventions for paper names, filing, and syncing the _reductions_ bibliography.

## CiteULike
I started adding papers here and built up a reasonable SML group there but the overhead of adding information when I just want to note something and move on is too high. Integration with BibDesk is good but requires me to tag smarter and come up with a good workflow to be of real use.

- Interface is too clunky for quick saving.
- Avoid using for things to read later. 
- Main advantage is BibTeX output, integration with BibDesk, and ability to archive PDFs.

## Instapaper
Instapaper is great thanks to its integration with iPhone apps such as Twitter but I think I will try to keep it for personal, non-work-related stuff.

- Keep primary use for personal sites.

## [Delicious](http://delicious.com/mreid/)
I've been using this for sometime for all sorts of things. My set of tags has got out of control and I'm loathe to try and retrospectively fix it all up.

Nowadays, I do not put much work-related stuff on it and mainly check my network for interesting papers. Others, such as Cosma, Maxim, Tim, Shiva, etc. seem to use this effectively for noting papers to read later or summarising papers.

- Keep using for non-work-related stuff as tag-soup is too rich and not worth simplifying. 

## [Pinboard](http://pinboard.in/u:mreid/)
Just signed up for this and quite like it. It seems to be able to do Instapaper-like quick saving and automatically files sites a "toread". I would like to keep this mainly for work-related material and start with sensible tag conventions.

- Keep for work-related stuff and make it part of a workflow
- Build good tag conventions
- Use private tags for projects (start with .)

## Web Notes
Inspired by Cosma's [notebooks](http://www.cscs.umich.edu/~crshalizi/notebooks/), I started some text notes that I hope will end up under http://mark.reid.name/work/note/ . The idea is to keep a short summary of a topic along with annotated, recommended articles and a list that looks promising to read.

## Google Reader
I subscribe to several arXiv and journal feeds. These act as inputs to the workflow. The trick is deciding what is worth following up on and what should be ignored.

There is some facility to note things in Reader which I could try taking advantage of but may just mean another thing to regularly check.

# A Possible Solution
I could try the following approach to reference management. The workflow is roughly: Pinboard -> Web Notes -> BibDesk.

1. If I see something work-related but not a paper/book/etc. (e.g., blog post on REST, news about academia, etc.), use "Pin (Later)".
2. If I see a paper relevant to a topic, use "Pin" and add to that topic and tag with "to:note" tag.
3. Regularly scan through "toread" and "to:note" items. Cull mercilessly by filing under "bb" (Back-burner) if not useful. If something is relevant, add it to my "To Read" list in the web note corresponding to the topic. Replace "to:note" with "noted" tag.
4. Regularly scan through Web Notes and Pinboard in parallel. Add them to BibDesk then read, annotate, and rank them.

I may consider automating the "To read" section of web notes by pulling in the RSS feed from Pinboard onto each topic's page. This will require a bit of JavaScript trickery and some discipline for tagging articles.

## Tag Conventions
In an effort to keep my pinboard bookmarks sane, I will use the following conventions:

- by:LastName.FirstName -- Attribution
- to:\[read|note\] -- Next action
- via:\[name\] -- Who alerted me to the article
- on:topic -- Tags for topics
- .private -- Private tags



## Cleaning up
Doing the above requires some discipline. The other habits I should try to foster include:
- No random surfing. Stay focused on the task at hand. 
- Dump possibly useful web links found by chance in a "Follow Up" folder to be checked once a week and continue with current task.

