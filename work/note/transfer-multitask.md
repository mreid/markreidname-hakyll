---
title: Transfer and Multitask Learning
layout: note
date: 2010-08-30
update: 2010-08-31 

---
 
Machine learning is typically framed in terms of single learning tasks. Given a loss and some finite sample from some unknown distribution, try to find a hypothesis that minimises the expected loss for that distribution.

When there are two or more _related_ tasks to solve, multitask and transfer learning methods attempt to discover and exploit the relatedness in order to perform better than solving each task in isolation. The main difference (as I see it) between multitask and transfer learning is that in the former the learner is expected to perform well, on average, over all the tasks whereas in the latter there is usually some single target task on which the learner is assessed.

The perennial problem in this multiple task setting is determining whether tasks are related or not.

## Bounds

There is a small but significant amount of work done on establishing generalisation bounds for multi-task and transfer learning. The earliest work in this direction goes back to Baxter (1995, 1996, 1997, 1998, 2000) who derived both PAC/VC-style bounds (1995, 1996) and Bayesian/Information Theoretic bounds (1997). More recently, Ben-David and Schuller (2003), Maurer (2005, 2006 2009), Crammer et al. (2007, 2008), Ando and Zhang (2005), and others have provided more results of this type.

## People
Some links to people who have or still are working in multitask and transfer learning:
* [Rich Caruana](http://www.cs.cornell.edu/~caruana/)
* [Andreas Maurer](http://www.andreas-maurer.eu/)
* [Theodoros Evgeniou](http://www.insead.edu/facultyresearch/faculty/personal/tevgeniou/)
* [Jacob Abernethy](http://www.eecs.berkeley.edu/~jake/)

## Blog posts
Hal Daume III has a couple of post that touch on multitask learning: [Adaptation vs Adaptability](http://nlpers.blogspot.com/2008/05/adaptation-versus-adaptability.html) from 2008 and [Multitask Learning: should our hypothesis classes be the same](http://nlpers.blogspot.com/2010/08/multi-task-learning-should-our.html). 

# References

## Recommended

* Juba, B.,  _[Estimating Relatedness via Data Compression](http://people.csail.mit.edu/bjuba/papers/icml-multitask.pdf)_, ICML (2006).    
  +-- {.annote}
  Provides an algorithmic information theoretic take on the bias learning results of Baxter (2000), giving bounds on the sample complexity which decrease with a 1/n dependency on the number of tasks, n. Task relatedness here is in terms of the joint Kolmogorov complexity of hypotheses learnt independently on the tasks taken separately.
  
  While the results are beautifully derived, they unfortunately require an extremely large number of tasks to be valid (Section 4: "... the requirements on the number of tasks are prohibitive".). As Juba also points out in the discussion, the results are restricted to deterministic algorithms (i.e., not Gibbs classifiers, etc) and no lower bounds (i.e., necessary conditions on task relatedness) are given.
  =--

* Abernethy, J., Bartlett, P. L., and Rakhlin, A.,  _[Multitask learning with expert advice](http://www-stat.wharton.upenn.edu/~rakhlin/papers/AbeBarRak07.pdf)_, COLT (2007).
  +-- {.annote}
  Essentially, they consider a set of N experts making predictions on K tasks up to T rounds. They argue for a "multitask comparator" against which the forecaster's loss is evaluated. They assume there is some small set of experts that perform well across all tasks and the forecaster must compete against the minimal cumulative loss achieve by experts from that set.
  =--

## Read

* Vilalta, R. and Drissi, Y., _[A perspective view and survey of meta-learning](http://www.springerlink.com/content/uht2454516536079/)_, AI Review (2002).
  +-- {.annote}
  This very high-level survey is strictly broader than what I would consider transfer and multitask learning as it covers Wolpert's stacked generalisation, landmarking, and types of data set clustering.
  =--

## To Read

* Pan, J.P. and Yang, Q., _[A Survey on Transfer Learning](http://www.cs.ust.hk/~sinnopan/publications/TLsurvey_0822.pdf)_, IEEE Trans. on Knowledge and Data Eng. (2009).

* Argyriou, Micchelli, and Pontil, _[On Spectral Learning](http://jmlr.csail.mit.edu/papers/v11/argyriou10a.html)_, JMLR (2010).

* Lugosi, Papaspiliopoulos, and Stoltz, _[Online Multi-task Learning with Hard Constraints](http://arXiv.org/abs/0902.3526v2)_, arXiv (2009).

* Kolar, Lafferty, and Wasserman, _[Union Support Recovery in Multi-task Learning](http://arxiv.org/abs/1008.5211)_, arXiv:1008.5211 (2010).

* Ozawa, Roy and Roussinov, _[A Multitask Learning Model for Online Pattern Recognition](http://www.lib.kobe-u.ac.jp/repository/90001004.pdf)_, IEEE Trans. on Neural Networks (2009).
