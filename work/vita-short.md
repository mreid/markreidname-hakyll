---
layout: name
title: Curriculum Vitæ
section: Work
css: vita

---

# Mark Darren Reid - _Curriculum Vitæ_
[![Download PDF](/files/css/icon_pdf.gif)](/files/vita.pdf){.right .noprint}

+--{.small}
Research School of Computer Science    
College of Engineering and Computer Science    
The Australian National University, ACT 0200, Australia    
☍ <http://mark.reid.name> &nbsp; ☎ +61 4 1019 7656 &nbsp; ✉ <mark@reid.name>
=--


## Education
+-- {.section}
### 2007
* Ph.D., Computer Science, _University of New South Wales_.
  +-- {.details}
  Thesis: [DEFT Guessing: Using Inductive Transfer to Improve Rule Evaluation from Limited Data][unsw07] (Supervisors: [Prof. Claude Sammut](http://www.cse.unsw.edu.au/~claude/) and [Prof. Arun Sharma](http://staff.qut.edu.au/staff/sharmaak/))
  =--

### 1996
* B.Sc. (Hons), Pure Mathematics with Computer Science, _University of New South Wales_
  +-- {.details}
  First class honours (Course average: 92%)    
  Thesis: [Harmonic Measure on Radially Slit Disks][unsw96] (Supervisor: Dr. Byron Walden)
  =--
=--
[unsw96]: http//mark.reid.name/files/pubs/unsw96.pdf
[unsw07]: http://mark.reid.name/files/pubs/unsw07.pdf


## Employment
+--	{.section}
### 2007--Present
* Research Fellow, _[Research School of Computer Science][], The [Australian National University][], Canberra_
  +-- {.details}
  As part of the [Artificial Intelligence group][] at the [Research School of Computer Science][] I am investigating theoretical representations of and relationships between different types of machine learning problems. 
To date, this work has led to some deep connections between various notions of risk, information and divergences for binary classification problems as well as potentially fruitful connections to prediction markets.

  I have been contributed part-time to the NICTA machine learning group since July 2009.

  I am also co-leading the Linkage project _Protocols and Structures for Inference_ with Canon Research  to develop specifications for exposing machine learning algorithms as web services.
  =--

[Research School of Computer Science]: http://cs.anu.edu.au/
[Artificial Intelligence group]: http://ai.cecs.anu.edu.au/
[Australian National University]: http://anu.edu.au/

### 2005--2007
* Senior Research Engineer, _[Canon Information Research Systems Australia][CISRA], Sydney_
  +-- {.details}
As a research engineer I have investigated, implemented, evaluated and applied for patents for novel machine learning algorithms which solve problems related to Canon's business interests. I have taken a primary role in three research projects and contributed to several others.
During this time I have familiarised myself with research into ensemble methods, Bayesian inference, cost-sensitive learning, kernel methods, and spectral methods for dimensional reduction. Some of these techniques were evaluated on large, noisy, high-dimensional datasets.
My other responsibilities include managing an undergraduate intern, presentation of machine learning papers to CISRA's journal club, various software engineering tasks and patent activities.
  =--
[CISRA]: http://www.cisra.com.au/

### 2004--2005
* Research Officer, _[Smart Internet Technology CRC][], Sydney_
  +-- {.details}
As a part-time research officer I developed a user interface for a handheld device as part of a technology demonstration for a mobile communications project. I also added some extensions to a Java messaging framework and audited it for J2ME compliance.
  =--

[Smart Internet Technology CRC]: http://www.smartservicescrc.com.au/AboutUs.html

### 2001--2003
* Senior Developer, _[Proxima Technology][], Sydney_
  +-- {.details}
During my part-time work at Proxima I developed various aspects of the company's flagship product: Centauri, an IT services monitoring and reporting tool. This included: researching machine learning approaches to predicting service faults; implementing a parser and interpreter for a language expressing service contracts; creating tools for automated building, testing and packaging; and instigating the use of a wiki for improved developer communication.
  =--

[Proxima Technology]: http://www.computerworld.com.au/article/177083/compuware_acquires_local_r_d_centre/

=--

## External Grants
+-- {.section}

### 2009--2012
* Co-Chief Investigator (with Robert Williamson), ARC Linkage Project _Structures and Protocols for Inference_. Linkage Partner: [Canon Information Systems Research Australia][cisra] (CISRA)
  +-- {.details}
  The aim of this project is to make it easier to get machine learning tools into the hands of people who work with data. To do this we plan to develop an inferential architecture for machine learning technology comprising protocols and data structures that allow the use and composition of a variety of software toolkits while avoiding the problems described above. The end result will be a means to use inferential technology that neither requires expert knowledge of the inner workings, nor the learning of a new language and API for each new toolkit.

  Total Funding: A$445,000 over 3 years (ARC + CISRA).
  =--
=--


## Teaching
+-- {.section}

### Lecturing
* Convening and co-lecturing _[Information Theory (COMP2610)](http://cs.anu.edu.au/courses/COMP2610/)_, ANU, Semester 2, 2011
 +-- {.details}
 Student evaluations scores for _Experience of Learning_ averaged 3.9/5 and _Experience of Lecturing_ averaged 4.3/5 with comments regarding my lecturing including: "Mark is very carefully spoken, allowing him to explain concepts clearly."; "very good lecturer"; and "Mark was an excellent lecturer".
 =--

=--

## Professional Activities
+-- {.section}
### Committees
* PC for International Conference on Machine Learning (ICML), 2012
* PC for International Conference on [Algorithmic Learning Theory](http://www-alg.ist.hokudai.ac.jp/~thomas/ALT10/pc.html) (ALT), 2010

=--

<script type="text/javascript" src="/files/js/jquery.js"> </script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".section").addClass('toggleable');
		$(".details").addClass('toggleable');
		$(".details").prev().addClass('hide');

		$(".toggleable").prev().addClass('toggle');
		$(".section").prev(".toggle").prepend("<span class='showhide left'>&nbsp;</span>");
		$(".section .toggle").append("<span class='showhide'>&nbsp;</span>");
		$(".showhide").click(function() { $(this).parent().toggleClass('hide'); });


		$(".section").prev(".toggle").append("<span class='all'>&nbsp;</span>");
		$("#page h1").append("<span class='all'>&nbsp;</span>");
		$("h2 .all").toggle(function() { 
			$(this).addClass('show'); 
			$(this).parent().next(".section").find(".toggle").removeClass("hide"); 
		}, function() {
			$(this).removeClass('show'); 
			$(this).parent().next(".section").find(".toggle").addClass("hide"); 			
		});

		$("h1 .all").toggle(function() {
			$(this).addClass('show'); 
			$(".toggle").removeClass("hide"); 
		}, function() {
			$(this).removeClass('show'); 
			$(".toggle").addClass("hide");
		});
	});
</script>


