---
title: What does the “OSS” in MLOSS mean?
excerpt: A summary of a recent discussion between the JMLR Machine Learning Open Source Software (MLOSS) Action Editors about what “open” means.
location: Canberra, Australia
---

I was recently asked to become an Action Editor for the 
[Machine Learning and Open Source Software (MLOSS)][MLOSS] track of Journal of
Machine Learning Research. Of course, I gladly accepted since the [aim][] of
the JMLR MLOSS track (as well as the [broader MLOSS project][]) -- to encourage
the creation and use of open source software within machine learning -- is well
aligned with my own interests and attitude towards scientific software.

Shortly after I joined, one of the other editors raised a question about how we
are to interpret an item in the [review criteria][] that states that reviewers
should consider the "freedom of the code (lack of dependence on proprietary
software)" when assessing submissions. What followed was an engaging email
discussion amongst the Action Editors about the how to clarify our position. 

After some discussion (summarised below), we settled on the following guideline
which tries to ensure MLOSS projects are as open as possible while recognising
the fact that MATLAB, although "closed", is nonetheless widely used within the
machine learning community and has an open "work-alike" in the form of 
[GNU Octave][]:

> **Dependency on Closed Source Software**
>
> We strongly encourage submissions that do not depend on closed source and
> proprietary software. Exceptions can be made for software that is widely used
> in a relevant part of the machine learning community and accessible to most
> active researchers; this should be clearly justified in the submission.
>
> The most common case here is the question whether we will accept software
> written for Matlab. Given its wide use in the community, there is no strict
> reject policy for MATLAB submissions, but we strongly encourage submissions to
> strive for compatibility with Octave unless absolutely impossible.



## The Discussion

There were a number of interesting arguments raised during the discussion, so I
offered to write them up in this post for posterity and to solicit feedback from
the machine learning community at large.


### Reviewing and decision making

A couple of arguments were put forward in favour of a strict "no proprietary
dependencies" policy.

Firstly, allowing proprietary dependencies may limit our ability to find reviewers 
for submissions -- an already difficult job. Secondly, stricter policies have the
benefit of being unambiguous, which would avoid future discussions about the 
acceptability of future submission.



### Promoting open ports

An argument made in favour of accepting projects with proprietary 
dependencies was that doing so may actually increase the chances of its code being 
forked to produce a version with no such dependencies. 

[Mikio Braun][] explored this idea further along with
some broader concerns in a [blog post][] about the role of curation and how it 
potentially limits collaboration.



### Where do we draw the line?

Some of us had concerns about what exactly constitutes a proprietary dependency 
and came up with a number of examples that possibly fall into a grey area.

For example, how do operating systems fit into the picture? 
What if the software in question only compiles on Windows or OS X? These are both
widely used but proprietary. Should we ensure MLOSS projects also work on Linux?

Taking a step up the development chain, what if the code base is most easily built 
using proprietary development tools such as Visual Studio or XCode? 
What if libraries such as MATLAB's Statistics Toolbox or Intel's MKL library are 
needed for performance reasons?
  
Things get even more subtle when we note that certain data formats (_e.g._, for 
medical imaging) are proprietary. Should such software be excluded even though the 
algorithms might work on other data?

These sorts of considerations suggested that a very strict policy may be difficult
to enforce in practice.



### What is our focus?

It is pretty clear what position Richard Stallman or other fierce free software 
advocates would take on the above questions: reject all of them!
It is not clear that such an extreme position would necessarily suit the goals of
the MLOSS track of JMLR.

Put another way, is the focus of MLOSS the "ML" or the "OSS"?
The consensus seemed to be that we want to promote open source software to 
benefit machine learning, not the other way around. 





## Looking At The Data

Towards the end of the discussion, I made the argument that if we cannot be 
coherent we should at least be consistent and presented some data on all 
the [accepted MLOSS submissions][].
Table 1 below shows the breakdown of languages used by the 50 projects that
have been accepted to the JMLR track to date. I'll note that some projects use
and/or target multiple languages and that, because I only spent half an hour
surveying the projects, I may have inadvertently misrepresented some (if
I've done so, let me know).

-------------- ----- ------ -------- -------- -------- --- ---
  **Language**  C++   Java   Matlab   Octave   Python   C   R
     **Count**   15    13      11       10        9     5   4
-------------- ----- ------ -------- -------- -------- --- ---

: _Table 1_: Frequency of languages used in MLOSS projects.

From this we can see that MATLAB is fairly well-represented amongst the accepted 
MLOSS projects. I took a closer look and found that of the 11 projects that are
written in (or provide bindings for) MATLAB, all but one of them provide support
for GNU Octave compatibility as well.



## Closing Thoughts

I think the position we've adopted is realistic, consistent, and suitably 
aspirational.
We want to encourage and promote projects that strive for openness and the positive
effects it enables (_e.g._, reproducibility and reuse) but do not want to strictly
rule out submissions that require a widely used, proprietary platform such as MATLAB. 

Of course, a project like MLOSS is only as strong as the community it serves so we
are keen to get feedback about this decision from people who use and create machine 
learning software so feel free to leave a comment or contact one of us by email.

----

**Shameless Plug**: If you are working on some open source software for machine learning, I encourage you to consider submitting your work to the [JMLR MLOSS track][MLOSS] or the upcoming [NIPS 2013 Workshop on Machine Learning Open Source Software][workshop] (I'm on the program committee).

[workshop]: http://mloss.org/workshop/nips13/

[MLOSS]: http://jmlr.org/mloss/
[aim]: http://jmlr.org/mloss/mloss-info.html
[broader MLOSS project]: http://mloss.org/about/

[Antti Honkela]: http://www.hiit.fi/u/ahonkela/
[review criteria]: http://jmlr.org/mloss/mloss-info.html

[GNU Octave]: http://www.gnu.org/software/octave/

[Mikio Braun]: http://mikiobraun.de
[blog post]: http://blog.mikiobraun.de/2013/08/curation-collaboration-science.html
[Cheng Soon Ong]: http://www.ong-home.my
[Geoff Holmes]: http://www.cms.waikato.ac.nz/genquery.php?linklist=SCMS&linktype=folder&linkname=The_Dean-0

[MLOSS blog]: http://mloss.org/community/

[accepted MLOSS submissions]: http://jmlr.org/mloss/
