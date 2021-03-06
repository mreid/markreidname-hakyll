---
layout: name
title: Publications
section: Work
---

Publications
============
Below is a list of my publications, including [book chapters](#book_chapters), [journal articles](#journal_articles), and refereed [conference papers](#conference_papers) and [workshop presentations](#refereed_workshops). Also shown are non-refereed [technical reports](#technical_reports), my [PhD thesis](#thesis), and [patents](#patents). Please see my [Google Scholar profile][scholar] for a full list of citations and co-authors.


## Journal Articles
<div class="section">
## 2015
**Fast Rates in Statistical and Online Learning**    
[Tim van Erven][tim], [Peter D. Grünwald][peter], [Nishant A. Mehta][nishant], Mark D. Reid, [Robert C. Williamson][bob]    
Journal of Machine Learning Research (Special Issue, Vol. 16)    
{ [PDF][jmlr15-pdf] | [JMLR][jmlr15] | [Abstract][] | [BibTeX][]  }

 <div class="abstract">
### Abstract
The speed with which a learning algorithm converges as it is presented with more data is a central problem in machine learning --- a fast rate of convergence means less data is needed for the same level of performance. The pursuit of fast rates in online and statistical learning has led to the discovery of many conditions in learning theory under which fast learning is possible. We show that most of these conditions are special cases of a single, unifying condition, that comes in two forms: the _central condition_ for `proper' learning algorithms that always output a hypothesis in the given model, and _stochastic mixability_ for online algorithms that may make predictions outside of the model. We show that under surprisingly weak assumptions both conditions are, in a certain sense, equivalent. The central condition has a re-interpretation in terms of convexity of a set of pseudoprobabilities, linking it to density estimation under misspecification. For bounded losses, we show how the central condition enables a direct proof of fast rates and we prove its equivalence to the _Bernstein_ condition, itself a generalization of the _Tsybakov margin condition_, both of which have played a central role in obtaining fast rates in statistical learning. Yet, while the Bernstein condition is two-sided, the central condition is one-sided, making it more suitable to deal with unbounded losses. In its stochastic mixability form, our condition generalizes both a _stochastic exp-concavity_ condition identified by Juditsky, Rigollet and Tsybakov and Vovk's notion of _mixability_. Our unifying conditions thus provide a substantial step towards a characterization of fast rates in statistical learning, similar to how classical mixability characterizes constant regret in the sequential prediction with expert advice setting.
 </div>

 <div class="bibtex">
### BibTeX
    @article{vanErven:2015,
	    Author = {{van Erven}, Tim and Gr\"{u}nwald, Peter and Mehta, Nishant A. and Reid, Mark D. and Williamson, Robert C.},
		Journal = {Journal of Machine Learning Research},
		Month = {September},
		Pages = {1793--1861},
		Title = {Fast Rates for Statistical and Online Learning},
		Volume = {16},
		Year = {2015}
	}
 </div>

## 2014
**A Hybrid Loss for Multiclass and Structured Prediction**    
[Qinfeng Shi][javen], Mark D. Reid, [Tiberio Caetano][tiberio], [Anton van den Hengel][anton], and [Zhenhau Wang][zhenhau]    
IEEE Trans. on Pattern Analysis and Machine Intelligence (Vol. 37)    
{ [DOI](http://dx.doi.org/10.1109/TPAMI.2014.2306414) | [arXiv Preprint](http://arxiv.org/abs/1402.1921) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We propose a novel hybrid loss for multiclass and structured prediction problems that is a convex combination of a log loss for Conditional Random Fields (CRFs) and a multiclass hinge loss for Support Vector Machines (SVMs). We provide a sufficient condition for when the hybrid loss is Fisher consistent for classification. This condition depends on a measure of dominance between labels--specifically, the gap between the probabilities of the best label and the second best label. We also prove Fisher consistency is necessary for parametric consistency when learning models such as CRFs. We demonstrate empirically that the hybrid loss typically performs least as well as--and often better than--both of its constituent losses on a variety of tasks, such as human action recognition. In doing so we also provide an empirical comparison of the efficacy of probabilistic and margin based approaches to multiclass and structured prediction.
 </div>

 <div class="bibtex">
### BibTeX
    @article{Shi:2014,
	    Author = {Qinfeng Shi and Mark D. Reid and Tiberio Caetano and Anton {van den Hengel} and Zhenhau Wang},
		Journal = {IEEE Transactions on Pattern Analysis and Machine Intelligence},
		Month = {February},
		Pages = {2--12},
		Title = {A Hybrid Loss for Multiclass and Structured Prediction},
		Volume = {37},
		Year = {2014}
	}
 </div>

**An Improved Multiclass LogitBoost Using Adaptive-One-vs-One**    
[Peng Sun][peng], Mark D. Reid, and [Jie Zhou][jie]    
Machine Learning Journal (Vol. 97)    
{ [DOI](http://dx.doi.org/10.1007/s10994-014-5434-3) | [Preprint][mlj14-aoso] | [Abstract]() }

 <div class="abstract">
### Abstract
LogitBoost is a popular Boosting variant that can be applied to either binary or multi-class classification. From a statistical viewpoint Logit- Boost can be seen as additive tree regression by minimizing the Logistic loss. Following this setting, it is still non-trivial to devise a sound multi-class LogitBoost compared with to devise its binary counterpart. The di culties are due to two important factors arising in multiclass Logistic loss. The first is the invariant property implied by the Logistic loss, causing the optimal classifier output being not unique, i.e., adding a constant to each component of the output vector won’t change the loss value. The second is the density of the Hessian matrices that arise when computing tree node split gain and node value fittings. Oversimplification of this learning problem can lead to degraded performance. For example, the original LogitBoost algorithm is outperformed by ABC-LogitBoost thanks to the latter’s more careful treatment of the above two factors.
In this paper we propose new techniques to address the two main difficulties in multiclass LogitBoost setting: 1) we adopt a vector tree model (i.e., each node value is vector) where the unique classifier output is guaranteed by adding a sum-to-zero constraint, and 2) we use an adaptive block coordinate descent that exploits the dense Hessian when computing tree split gain and node values. Higher classification accuracy and faster convergence rates are observed for a range of public data sets when compared to both the original and the ABC-LogitBoost implementations.
We also discuss another possibility to cope with LogitBoost’s dense Hessian matrix. We derive a loss similar to the multi-class Logistic loss but which guarantees a diagonal Hessian matrix. While this makes the optimization (by Newton descent) easier we unfortunately observe degraded performance for this modification. We argue that working with the dense Hessian is likely unavoidable, therefore making techniques like those proposed in this paper necessary for efficient implementations.
 </div>

 <div class="bibtex">
### BibTeX
	@article{Sun:2014,
       Author = {Sun, Peng and Reid, Mark D. and Zhou, Jie},
	   Journal = {Machine Learning},
	   Month = {December},
	   Volume = {97},
	   Issue = {3},
	   Pages = {295--326},
	   Title = {An Improved Multiclass LogitBoost Using Adaptive-One-vs-One},
	   Year = {2014}
 </div>

## 2012
**Mixability is Bayes Risk Curvature Relative to Log Loss**     
[Tim van Erven][tim], Mark D. Reid, and [Robert C. Williamson][bob]    
Journal of Machine Learning Research (Vol. 13)   
{ [PDF](http://jmlr.csail.mit.edu/papers/volume13/vanerven12a/vanerven12a.pdf) | [JMLR](http://jmlr.csail.mit.edu/papers/v13/vanerven12a.html) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Mixability of a loss characterizes fast rates in the online learning setting of prediction with expert advice. The determination of the mixability constant for binary losses is straightforward but opaque. In the binary case we make this transparent and simpler by characterising mixability in terms of the second derivative of the Bayes risk of proper losses. We then extend this result to multiclass proper losses where there are few existing results. We show that mixability is governed by the maximum eigenvalue of the Hessian of the Bayes risk, relative to the Hessian of the Bayes risk for log loss. We conclude by comparing our result to other work that bounds prediction performance in terms of the geometry of the Bayes risk. Although all calculations are for proper losses, we also show how to carry the results across to improper losses.
 </div>

 <div class="bibtex">
### BibTeX
    @article{van-Erven:2012,
	  Author = { {van Erven}, Tim and Reid, Mark D. and Williamson, Robert C.},
	  Journal = {Journal of Machine Learning Research},
	  Month = {May},
	  Pages = {1639--1663},
	  Title = {Mixability is Bayes Risk Curvature Relative to Log Loss},
	  Volume = {13},
	  Year = {2012}}
 </div>


## 2011
**Information, Divergence and Risk for Binary Experiments**     
Mark D. Reid and [Robert C. Williamson][bob]    
Journal of Machine Learning Research (Vol. 12)   
{ [PDF](http://www.jmlr.org/papers/volume12/reid11a/reid11a.pdf) | [JMLR](http://jmlr.csail.mit.edu/papers/v12/reid11a.html) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We unify f-divergences, Bregman divergences, surrogate regret bounds, proper scoring rules, cost curves, ROC-curves and statistical information. We do this by systematically studying integral and variational representations of these objects and in so doing identify their representation primitives which all are related to cost-sensitive binary classification. As well as developing relationships between generative and discriminative views of learning, the new machinery leads to tight and more general surrogate regret bounds and generalised Pinsker inequalities relating f-divergences to variational divergence. The new viewpoint also illuminates existing algorithms: it provides a new derivation of Support Vector Machines in terms of divergences and relates maximum mean discrepancy to Fisher linear discriminants.
 </div>

 <div class="bibtex">
### BibTeX
	@article{Reid:2011,
	  Author = {Reid, Mark D. and Williamson, Robert C.},
	  Journal = {Journal of Machine Learning Research},
	  Month = {March},
	  Pages = {731--817},
	  Title = {Information, Divergence and Risk for Binary Experiments},
	  Volume = {12},
	  Year = {2011}}    
 </div>

## 2010
**Composite Binary Losses**     
Mark D. Reid and [Robert C. Williamson][bob]    
Journal of Machine Learning Research (Vol. 11)   
{ [PDF](http://www.jmlr.org/papers/volume11/reid10a/reid10a.pdf) | [JMLR](http://jmlr.csail.mit.edu/papers/v11/reid10a.html) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We study losses for binary classification and class probability estimation and extend the understanding of them from margin losses to general composite losses which are the composition of a proper loss with a link function. We characterise when margin losses can be proper composite losses, explicitly show how to determine a symmetric loss in full from half of one of its partial losses, introduce an intrinsic parametrisation of composite binary losses and give a complete characterisation of the relationship between proper losses and "classification calibrated" losses. We also consider the question of the "best" surrogate binary loss. We introduce a precise notion of "best" and show there exist situations where two convex surrogate losses are incommensurable. We provide a complete explicit characterisation of the convexity of composite binary losses in terms of the link function and the weight function associated with the proper loss which make up the composite loss. This characterisation suggests new ways of "surrogate tuning" as well as providing an explicit characterisation of when Bregman divergences on the unit interval are convex in their second argument. Finally, in an appendix we present some new algorithm-independent results on the relationship between properness, convexity and robustness to misclassification noise for binary losses and show that all convex proper losses are non-robust to misclassification noise.
 </div>

 <div class="bibtex">
### BibTeX

    @article{Reid:2009b,
	  Author = {Reid, M.D. and Williamson, R.C.},
	  Journal = {Journal of Machine Learning Research},
	  Month = {September},
	  Title = {Composite Binary Losses},
	  Volume = {11},
	  Year = {2010}} 
 </div>

## 2002
**Cross-training and its Application to Skill-Mining**.    
Daniel Oblinger, Mark Reid, Mark Brodie, and Rodrigo de Salvo Braz.   
IBM Systems Journal (Vol. 41, No. 3)     
{ [PDF][isj01] | [Abstract]() | [BibTeX]() }

<div class="abstract">
### Abstract
We present an approach for cataloging an organization’s skill assets based on electronic communications. Our approach trains classifiers using messages from skill-related discussion groups and then applies those classifiers to a different distribution of person-related e-mail messages. We present a general framework, called cross training, for addressing such discrepancies between the training and test distributions. We outline two instances of the general cross-training problem, develop algorithms for each, and empirically demonstrate the efficacy of our solution in the skill-mining context. 
 </div> 

 <div class="bibtex">
### BibTeX

	@article{Oblinger:2002,
	  Author = {Oblinger, Daniel and Reid, Mark D. and Brodie, Mark and {de Salvo Braz}, Rodrigo},
	  Journal = {IBM Systems Journal},
	  Number = {3},
	  Pages = {449--460},
	  Title = {Cross-training and its Application to Skill-Mining},
	  Volume = {41},
	  Year = {2002}}
 </div>

</div>





## Conference Papers
<div class="section">
## 2015

**Convergence Analysis of Prediction Markets via Randomized Subspace Descent**    
[Rafael M. Frongillo][raf] and Mark D. Reid     
To appear in Neural Information Processing Systems [(NIPS 2015)][nips15]    
{  [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Prediction markets are economic mechanisms for aggregating information about future events through sequential interactions with traders. The pricing mechanisms in these markets are known to be related to optimization algorithms in machine learning and through these connections we have some understanding of how equilibrium market prices relate to the beliefs of the traders in a market. However, little is known about rates and guarantees for the convergence of these sequential mechanisms, and two recent papers cite this as an important open question.

In this paper we show how some previously studied prediction market trading models can be understood as a natural generalization of randomized coordinate descent which we call _randomized subspace descent_ (RSD). We establish convergence rates for RSD and leverage them to prove rates for the two prediction market models above, answering the open questions. Our results extend beyond standard centralized markets to arbitrary trade networks.
 </div>

 <div class="bibtex">
### BibTeX

	@InProceedings{frongillo15,
     author = {Frongillo, Rafael, M. and Reid, Mark D.},
     title = {Convergence Analysis of Prediction Markets via Randomized Subspace Descent},
     booktitle = {Proceedings of Neural Information Processing Systems (NIPS)},
	 address = {Montreal, Canada},
	 month = {Decemeber},
	 year = {2015}}

 </div>



**Protocols and Structures for Inference: A RESTful API for Machine Learning**    
[James Montgomery][ejm], Mark D. Reid and Barry Drake    
Proceedings of the 2nd International Conference on Predictive APIs and Applications ([PAPIs 2015][papis15])    
{  [Abstract]() | [BibTeX]() | [Slides][papis-psi15] }

 <div class="abstract">
### Abstract
 Diversity in machine learning APIs (in both software toolkits and web services), 
 works against realising machine learning’s full potential, making it difficult 
 to draw on individual algorithms from different products or to compose multiple 
 algorithms to solve complex tasks. This paper introduces the 
 _Protocols and Structures for Inference_ (PSI) service architecture and 
 specification, which presents inferential entities—relations, attributes, 
 learners and predictors—as RESTful web resources that are accessible via a common 
 but flexible and extensible interface. Resources describe the data they ingest 
 or emit using a variant of the JSON schema language, and the API has mechanisms 
 to support non-JSON data and future extension of service features.
 </div>

 <div class="bibtex">
### BibTeX
    
	@InProceedings{montgomery15,
     author = {Montgomery, James and Reid, Mark D. and Drake, Barry},
     title = {Protocols and Structures for Inference: A {REST}ful {API} for Machine Learning},
     booktitle = {Proceedings of the 2nd International Conference on Predictive APIs and Applications (PAPIs)},
	 address = {Sydney, Australia},
	 month = {July},
	 year = {2015}}

 </div>



**Generalized Mixability via Entropic Duality**    
Mark D. Reid, [Rafael M. Frongillo][raf], [Robert C. Williamson][bob] and [Nishant Mehta][nishant]    
Conference on Learning Theory [(COLT 2015)][colt15]    
{ [PDF][colt15-gen-mix] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
  Mixability is a property of a loss which characterizes when constant regret 
  is possible in the game of prediction with expert advice. We show that a key
  property of mixability generalizes, and the $\exp$ and $\log$ operations
  present in the usual theory are not as special as one might have thought.  In
  doing so we introduce a more general notion of $\Phi$-mixability where $\Phi$
  is a general entropy (_i.e._, any convex function on probabilities). We
  show how a property shared by the convex dual of any such entropy yields
  a natural algorithm (the minimizer of a regret bound) which, analogous to the
  classical Aggregating Algorithm, is guaranteed a constant regret when used
  with $\Phi$-mixable losses.  We characterize which $\Phi$ have non-trivial
  $\Phi$-mixable losses and relate $\Phi$-mixability and its associated
  Aggregating Algorithm to potential-based methods, a Blackwell-like condition,
  mirror descent, and risk measures from finance.  We also define a notion of
  ``dominance'' between different entropies in terms of bounds they guarantee
  and conjecture that classical mixability gives optimal bounds, for which we
  provide some supporting empirical evidence. 
 </div>

 <div class="bibtex">
### BibTeX
    
	@InProceedings{reid15,
     author = {Reid, Mark D. and Frongillo, Rafael M. and Williamson, Robert C. and Mehta, Nishant},
     title = {Generalized Mixability via Entropic Duality},
     booktitle = {Proceedings of the 28th Conference on Learning Theory},
	 address = {Paris, France},
	 month = {July},
	 year = {2015}}

 </div>



## 2013
**Convex Foundations for Generalized MaxEnt Models**    
[Rafael Frongillo][raf] and Mark D. Reid    
International Workshop on Bayesian Inference and Maximum Entropy [(MaxEnt 2013)][maxent13]    
{ [PDF][maxent13-convex-gefs] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
  We present an approach to maximum entropy models that highlights the convex
  geometry and duality of GEFs and their connection to Bregman divergences.
  Using our framework, we are able to resolve a puzzling aspect of the
  bijection of Banerjee et al. (2005) between classical exponential
  families and what they call _regular_ Bregman divergences.
  Their regularity condition rules out all but Bregman divergences generated
  from log-convex generators.
  We recover their bijection and show that a much broader class of divergences
  correspond to GEFs via two key observations: 
    1) Like classical exponential families, GEFs have a ``cumulant'' $C$ whose 
	   subdifferential contains the mean: 
	   $\mathbb{E}_{o\sim p_\theta}\left[\phi(o)\right] \in \partial C(\theta)$; 
	2) Generalized relative entropy is a $C$-Bregman divergence between parameters:
       $D_F(p_\theta, p_{\theta'}) = D_C(\theta,\theta')$, where $D_F$ becomes the
       KL divergence for $F = -H$.
  We also show that every _incomplete_ market with cost function $C$
  (see Abernethy et al. (2011)) can be expressed as a complete
  market, where the prices are constrained to be a GEF with cumulant $C$.
  This provides an entirely new interpretation of prediction markets, relating their
  design back to the principle of maximum entropy. 
  </div>

 <div class="bibtex">
### BibTeX

    @InProceedings{Frongillo:2013,
	  Address = {Canberra, Australia},
	  Author = {Frongillo, Rafael and Reid, Mark D.},
	  Booktitle = {Proceedings of the 33rd International Workshop on Bayesian Inference and Maximum Entropy Methods in Science and Engineering},
	  Month = {December},
	  Title = {Convex Foundations for Generalized MaxEnt Models},
	  Year = {2013}}

 </div>

**Conjugate Priors for Generalized MaxEnt Families**    
[Brendan van Rooyen][brendan] and Mark D. Reid    
International Workshop on Bayesian Inference and Maximum Entropy [(MaxEnt 2013)][maxent13]    
{ [PDF][maxent13-update-gefs] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
  In this work we show that a notion of a conjugate prior for non exponential
  family distributions can be recovered if one uses a slightly modified version
  of Bayesian updating. We prove some theorems concerning this new updating
  rule before giving a simple example of such a generalized conjugate prior.
 </div>

 <div class="bibtex">
### BibTeX

    @conference{vanRooyen:2013,
	  Address = {Canberra, Australia},
	  Author = {van Rooyen, Brendan and Reid, Mark D.},
	  Booktitle = {Proceedings of the 33rd International Workshop on Bayesian Inference and Maximum Entropy Methods in Science and Engineering},
	  Month = {December},
	  Title = {Conjugate Priors for Generalized MaxEnt Families},
	  Year = {2013}}

 </div>


**Aggregating Predictions via Sequential Mini-Trading**    
[Mindika Premachandra][mindika] and Mark D. Reid    
Asian Conference on Machine Learning [(ACML 2013)][acml13]    
{ [PDF][acml13-minitrade] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
  Prediction markets which trade on contracts representing unknown future
  outcomes are designed specifically to aggregate expert predictions via the
  market price. While there are some existing machine learning interpretations
  for the market price and connections to Bayesian updating under the
  equilibrium analysis of such markets, there is less of an understanding
  of what the instantaneous price in sequentially traded markets means. In
  this paper we show that the prices generated in sequentially traded
  prediction markets are stochastic approximations to the price given by an
  equilibrium analysis. We do so by showing the equilibrium price is
  a solution to a stochastic optimisation problem which is solved by
  stochastic mirror descent (SMD) by a class of sequential pricing
  mechanisms. This connection leads us to propose a scheme called
  “mini-trading” which introduces a parameter related to the learning rate
  in SMD. We prove several properties of this scheme and show that it can
  improve the stability of prices in sequentially traded prediction
  markets.
 </div>

 <div class="bibtex">
### BibTeX

    @conference{Premachandra:2013,
	  Address = {Canberra, Australia},
	  Author = {Premachandra, Mindika and Reid, Mark D.},
	  Booktitle = {Proceedings of Asian Conference on Machine Learning (ACML)},
	  Month = {November},
	  Title = {Aggregating Predictions via Sequential Mini-Trading},
	  Year = {2013}}

 </div>


## 2012

**Mixability in Statistical Learning**    
[Tim van Erven][tim], [Peter Grünwald][peter], Mark D. Reid, and [Robert Williamson][bob]   
Neural Information Processing Systems [(NIPS 2012)][nips12]    
{ [PDF][nips12-stochmix] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
  Statistical learning and sequential prediction are two different but
  related formalisms to study the quality of predictions. Mapping out their
  relations and transferring ideas is an active area of
  investigation. We provide another piece of the puzzle by showing that an
  important concept in sequential prediction, the mixability of a loss, has
  a natural counterpart in the statistical setting, which we call
  _stochastic mixability_. 
  Just as ordinary mixability
  characterizes fast rates in sequential prediction in terms of worst-case
  regret, stochastic mixability characterizes fast rates in
  statistical learning. We show that, in the special case of log-loss,
  stochastic mixability reduces to a well-known (but usually unnamed)
  condition used in existing convergence theorems for MDL and Bayesian
  inference. In the case of 0/1-loss, it reduces to the easiest case of
  the margin condition of Mammen and Tsybakov, and in the case that the model
  under consideration contains all possible predictors, it is equivalent
  to ordinary mixability. 
 </div>

 <div class="bibtex">
### BibTeX

    @conference{vanErven:2012,
	  Address = {Lake Tahoe, USA},
	  Author = {van Erven, Tim and Gr\"{u}nwald, Peter and Reid, Mark D. and Williamson, Robert C.},
	  Booktitle = {Proceedings of Neural Information Processing Systems},
	  Month = {December},
	  Title = {Mixability in Statistical Learning},
	  Year = {2012}}

 </div>

**Interpreting Prediction Markets: A Stochastic Approach**    
[Rafael M. Frongillo][raf], [Nicolás Della Penna][nikete], and Mark D. Reid   
Neural Information Processing Systems [(NIPS 2012)][nips12]    
{ [PDF][nips12-markets] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We strengthen recent connections between prediction markets and learning by showing that a natural class of market makers can be understood as performing stochastic mirror descent when trader demands are sequentially drawn from a fixed distribution.
This provides new insights into how market prices (and price paths) may be interpreted as a summary of the market's belief distribution by relating them to the optimization problem being solved.
In particular, we show that the stationary point of the stochastic process of prices generated by the market is equal to the market's Walrasian equilibrium of classic market analysis.
Together, these results suggest how traditional market making mechanisms might be replaced with general purpose learning algorithms while still retaining guarantees about their behaviour.
 </div>

 <div class="bibtex">
### BibTeX

    @conference{Frongillo:2012,
	  Address = {Lake Tahoe, USA},
	  Author = {Frongillo, Rafael and Della Penna, Nico\'{a}s and Reid, Mark D.},
	  Booktitle = {Proceedings of Neural Information Processing Systems},
	  Month = {December},
	  Title = {Interpreting Prediction Markets: A Stochastic Approach},
	  Year = {2012}}

 </div>



**Tighter Variational Representations of f-Divergences via Restriction to Probability Measures**    
[Avraham Ruderman][avi], [Dario García-García][dario], [James Petterson][jamesp], and Mark D. Reid   
International Conference on Machine Learning [(ICML 2012)][icml12]    
{ [PDF][icml12-fdiv] | [Abstract]() | [BibTeX]() | [Discuss](http://icml.cc/discuss/2012/361.html) }

 <div class="abstract">
### Abstract
We show that the variational representations for $f$-divergences currently used in the literature can be tightened. This has implications to a number of methods recently proposed based on this representation. As an example application we use our tighter representation to derive a general $f$-divergence estimator based on two i.i.d. samples and derive the dual program for this estimator that performs well empirically. We also point out a connection between our estimator and MMD. 

 </div>

 <div class="bibtex">
### BibTeX

    @conference{Ruderman:2012,
	  Address = {Edinburgh, Scotland},
	  Author = {Ruderman, Avraham and Garc{\'\i}a-Garc{\'\i}a, Dar{\'\i}o and Petterson, James and Reid, Mark D.},
	  Booktitle = {Proceedings of the International Conference on Machine Learning},
	  Month = {June},
	  Title = {Tighter Variational Representations of f-Divergences via Restriction to Probability Measures},
	  Year = {2012}}

 </div>




**The Convexity and Design of Composite Multiclass Losses**    
Mark D. Reid, [Peng Sun][peng], and [Robert C. Williamson][bob]    
International Conference on Machine Learning [(ICML 2012)][icml12]    
{ [PDF][icml12-multi] | [Abstract]() | [BibTeX]() | [Discuss](http://icml.cc/discuss/2012/367.html)}

 <div class="abstract">
### Abstract
We consider composite loss functions for multiclass prediction comprising a proper (_i.e._, Fisher-consistent) loss over probability distributions and an inverse link function. We establish conditions for their (strong) convexity and explore their implications. We also show how the separation of concerns afforded by using this composite representation allows for the design of families of losses with the same Bayes risk.

 </div>

 <div class="bibtex">
### BibTeX

    @conference{Reid:2012,
	  Address = {Edinburgh, Scotland},
	  Author = {Reid, Mark D. and Williamson, Robert C. and Sun, Peng},
	  Booktitle = {Proceedings of the International Conference on Machine Learning},
	  Month = {June},
	  Title = {The Convexity and Design of Composite Multiclass Losses},
	  Year = {2012}}

 </div>




**AOSO-LogitBoost: Adaptive One-Vs-One LogitBoost for Multi-Class Problems**    
[Peng Sun][peng], Mark D. Reid, and [Jie Zhou][jie]    
International Conference on Machine Learning [(ICML 2012)][icml12]    
{ [PDF][icml12-aoso] | [Abstract]() | [BibTeX]() | [Discuss](http://icml.cc/discuss/2012/569.html) }

 <div class="abstract">
### Abstract
This paper is dedicated to the improvement of model learning in multi-class LogitBoost for classification. Motivated by statistical view, LogitBoost can be seen as additive tree regression. Important facts in such a setting are 1) coupled classifier output as sum-to-zero constraint and 2) dense Hessian matrix arising in tree node split gain and node values fitting. On the one hand, the setting is too complicated for a tractable model learning algorithm; On the other hand, too aggressive simplification of the setting may lead to degraded performance. For example, the original LogitBoost is outperformed by ABC-LogitBoost due to the later's more careful treatment for the above two key points in problem settings.

In this paper we propose improved methods to address the challenge: we adopt 1) vector tree (_i.e._ node value is vector) that enforces sum-to-zero constraint and 2) adaptive block coordinate descent exploiting dense Hessian when computing tree split gain and node values. Higher classification accuracy and faster convergence rate are observed for a range of public data sets when comparing to both original and ABC LogitBoost.

 </div>

 <div class="bibtex">

    @conference{Sun:2012,
	  Address = {Edinburgh, Scotland},
	  Author = {Sun, Peng and Reid, Mark D. and Zhou, Jie},
	  Booktitle = {Proceedings of the International Conference on Machine Learning},
	  Month = {June},
	  Title = {AOSO-LogitBoost: Adaptive One-Vs-One LogitBoost for Multi-Class Problem},
	  Year = {2012}}

 </div>


**Crowd & Prejudice: An Impossibility Theorem for Crowd Labelling without a Gold Standard**    
[Nicolás Della Penna][nikete] and Mark D. Reid   
Collective Intelligence [(CI 2012)][procci2012]    
{ [PDF][ci12] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
A common use of crowd sourcing is to obtain labels for a dataset. Several algorithms have been proposed to identify uninformative members of the crowd so that their labels can be disregarded and the cost of paying them avoided. One common motivation of these algorithms is to try and do without any initial set of trusted labeled data. We analyse this class of algorithms as mechanisms in a game-theoretic setting to understand the incentives they create for workers. We find an impossibility result that without any ground truth, and when workers have access to commonly shared 'prejudices' upon which they agree but are not informative of true labels, there is always equilibria where all agents report the prejudice. A small amount amount of gold standard data is found to be sufficient to rule out these equilibria.
 </div>

 <div class="bibtex">
### BibTeX

	@inproceedings{DellaPenna:2012,
		Author = {Della Penna, Nicol\'{a}s and Reid, Mark D.},
		Booktitle = {Proceedings of Collective Intelligence (CI)},
		Title = {Crowd \& Prejudice: An Impossibility Theorem for Crowd Labelling without a Gold Standard},
		Year = {2012}}
 </div>

</div>

<div class="section">
## 2011
**Composite Multiclass Losses**    
Elodie Vernet, [Robert C. Williamson][bob], and Mark D. Reid   
Neural Information Processing Systems [(NIPS 2011)][procnips2011]    
{ [PDF][nips11] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We consider loss functions for multiclass prediction problems. We show when a  multiclass loss can be expressed as a "proper composite loss", which is the composition of a proper loss and a link function. We extend existing results for binary losses to multiclass losses.  We determine the stationarity condition, Bregman representation, order-sensitivity, existence and uniqueness of the composite representation for multiclass losses.  We subsume existing results on "classification calibration" by relating it to properness and show that the simple integral representation  for binary proper losses can not be extended to multiclass losses. 
 </div>

 <div class="bibtex">
### BibTeX

	@inproceedings{Vernet:2011,
		Author = {Vernet, Elodie and Williamson, Robert C. and Reid, Mark D.},
		Booktitle = {Proceedings of Neural Information Processing Systems (NIPS 2011)},
		Title = {Composite Multiclass Losses},
		Year = {2011}}
 </div>

**Mixability is Bayes Risk Curvature Relative to Log Loss**    
[Tim van Erven][tim], Mark D. Reid, and [Robert C. Williamson][bob]    
Conference on Learning Theory [(COLT 2011)][proccolt2011]    
{ [Video][colt11video] | [PDF][colt11] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
 Mixability of a loss governs the best possible performance when aggregating expert predictions with respect to that loss. The determination of the mixability constant for binary losses is straightforward but opaque. In the binary case we make this transparent and simpler by characterising mixability in terms of the second derivative of the Bayes risk of proper losses. We then extend this result to multiclass proper losses where there are few existing results. We show that mixability is governed by the Hessian of the Bayes risk, relative to the Hessian of the Bayes risk for log loss. We conclude by comparing our result to other work that bounds prediction performance in terms of the geometry of the Bayes risk. Although all calculations are for proper losses, we also show how to carry the results across to improper losses.
 </div>

 <div class="bibtex">
### BibTeX
    @inproceedings{van-Erven:2011,
	    Author = { {van Erven}, Tim and Reid, Mark D. and Williamson, Robert C.},
	    Booktitle = {Proceedings of the 24th Annual Conference on Learning Theory},
	    Title = {Mixability is Bayes Risk Curvature Relative to Log Loss},
	    Year = {2011}}
 </div>



## 2010
**Convexity of Proper Composite Binary Losses**     
Mark D. Reid and [Robert C. Williamson][bob]    
International Conference on Artificial Intelligence and Statistics [(AISTATS 2010)][aistats2010]    
{ [PDF][aistats10] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
A composite loss assigns a penalty to a real-valued prediction by associating the prediction with a probability via a link function then applying a class probability estimation (CPE) loss. If the risk for a composite loss is always minimised by predicting the value associated with the true class probability the composite loss is proper. We provide a novel, explicit and complete characterisation of the convexity of any proper composite loss in terms of its link and its "weight function" associated with its proper CPE loss. 
 </div>

 <div class="bibtex">
### BibTeX

  	@inproceedings{Reid:2010,
	 Address = {Sardinia, Italy},
	 Author = {Reid, Mark D. and Williamson, Robert C.},
	 Booktitle = {Proceedings of the 13th International Conference on Artificial Intelligence and Statistics (AISTATS)},
	 Month = {May},
	 Series = {JMLR: W\&CP},
	 Title = {Convexity of Proper Composite Binary Losses},
	 Volume = {9},
	 Year = {2010}}
 </div>


## 2009
**Kernel Conditional Quantile Estimation via Reduction Revisited**    
[Novi Quadrianto][novi], [Kristian Kersting][kristian], Mark Reid, [Tiberio Caetano][tiberio], and [Wray Buntine][wray]    
IEEE International Conference on Data Mining [(ICDM 2009)][procicdm]    
{ [PDF][icdm09] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Quantile regression refers to the process of estimating the quantiles of a conditional distribution and has many important applications within econometrics and data mining, among other domains. In this paper, we show how to estimate these quantile functions within a Bayes risk minimization framework using a Gaussian process prior. The resulting non-parametric probabilistic model is easy to implement and allows non-crossing quantile functions to be enforced. Moreover, it can directly be used in combination with tools and extensions of standard Gaussian Processes such as principled hyperparameter estimation, sparsification, and quantile regression with input-dependent noise rates. No existing approach enjoys all of these desirable properties. Experiments on benchmark datasets show that our method is competitive with state-of-the-art approaches.
 </div>

 <div class="bibtex">
### BibTeX

	@inproceedings{Quadrianto:2009,
	 Author = {Quadrianto, Novi and Kersting, Kristian and Reid, Mark D. and Caetano, Tiberio and Buntine, Wray},
	 Booktitle = {Proceedings of the IEEE International Conference on Data Mining (ICDM)},
	 Title = {Kernel Conditional Quantile Estimation via Reduction Revisited},
	 Year = {2009}}
 </div>


**Generalised Pinsker Inequalities**.      
Mark D. Reid and [Robert C. Williamson][bob]   
Conference on Learning Theory [(COLT 2009)][proccolt09]    
{ [PDF][colt09] | [Slides][colt09slides] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We generalise the classical Pinsker inequality which relates variational divergence to Kullback-Liebler divergence in two ways: we consider arbitrary f -divergences in place of KL divergence, and we assume knowledge of a sequence of values of generalised variational divergences. We then develop a best possible inequality for this doubly generalised situation. Specialising our result to the classical case provides a new and tight explicit bound relating KL to variational divergence (solving a problem posed by Vajda some 40 years ago). The solution relies on exploiting a connection between divergences and the Bayes risk of a learning problem via an integral representation.
 </div>

 <div class="bibtex">
### BibTeX
	@inproceedings{Reid:2009,
	 Author = {Reid, Mark D. and Williamson, Robert C.},
	 Booktitle = {Proceedings of the 22nd Annual Conference on Learning Theory},
	 Title = {Generalised Pinsker Inequalities},
	 Year = {2009}}
 </div>


**Surrogate Regret Bounds for Proper Losses**     
Mark D. Reid and [Robert C. Williamson][bob]    
International Conference on Machine Learning [(ICML 2009)][procicml09]    
{ [PDF][icml09] | [Slides][icml09slides] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We present tight surrogate regret bounds for the class of proper (i.e., Fisher consistent) losses. The bounds generalise the margin-based bounds due to Bartlett et al. (2006). The proof uses Taylor's theorem and leads to new representations for loss and regret and a simple proof of the integral representation of proper losses. We also present a different formulation of a duality result of Bregman divergences which leads to a demonstration of the convexity of composite losses using canonical link functions.
 </div>

 <div class="bibtex">
### BibTeX
	@inproceedings{Reid:2009a,
	 Author = {Reid, Mark D. and Williamson, Robert C.},
	 Booktitle = {Proceedings of the International Conference on Machine Learning},
	 Pages = {897--904},
	 Title = {Surrogate Regret Bounds for Proper Losses},
	 Year = {2009}}
 </div>


## 2004
**Improving Rule Evaluation Using Multitask Learning**    
Mark D. Reid    
International Conference on Inductive Logic Programming (ILP 2004)    
{ [PDF][ilp04] | [Slides][icml09slides] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
This paper introduces Deft, a new multitask learning approach for rule learning algorithms. Like other multitask learning systems, the one proposed here is able to improve learning performance on a primary task through the use of a bias learnt from similar secondary tasks. What distinguishes Deft from other approaches is its use of rule descriptions as a basis for task similarity. By translating a rule into a feature vector or "description", the performance of similarly described rules on the secondary tasks can be used to modify the evaluation of the rule for the primary task. This explicitly addresses diﬃculties with accurately evaluating, and therefore ﬁnding, good rules from small datasets. Deft is implemented on top of an existing ILP system and the approach is tested on a variety of relational learning tasks. Given appropriate secondary tasks, the results show that Deft is able to compensate for insufficient training examples. 
 </div>

 <div class="bibtex">
### BibTeX
	@inproceedings{Reid:2004,
	 Author = {Reid, Mark D.},
	 Booktitle = {Proceedings of the 14th International Conference on ILP},
	 Pages = {252--269},
	 Title = {Improving Rule Evaluation Using Multitask Learning},
	 Year = {2004}}
 </div>


## 2000
**Using ILP to Improve Planning in Hierarchical Reinforcement Learning**       
Mark Reid and [Malcolm Ryan][mal]   
International Conference on Inductive Logic Programming (ILP 2000)    
{ [PDF][ilp00] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Hierarchical reinforcement learning has been proposed as a solution to the problem of scaling up reinforcement learning. The RL-TOPs Hierarchical Reinforcement Learning System is an implementation of this proposal which structures an agent’s sensors and actions into various levels of representation and control. Disparity between levels of representation means actions can be misused by the planning algorithm in the system. This paper reports on how ILP was used to bridge these representation gaps and shows empirically how this improved the system’s performance. Also discussed are some of the problems encountered when using an ILP system in what is inherently a noisy and incremental domain.
 </div>

 <div class="bibtex">
### BibTeX
	@inproceedings{Reid:2000,
	 Author = {Reid, Mark D. and Ryan, Malcolm},
	 Booktitle = {Proceedings of the 10th International Conference on ILP},
	 Pages = {174--190},
	 Title = {Using ILP to Improve Planning in Hierarchical Reinforcement Learning},
	 Year = {2000}}
 </div>


**Learning to Fly: An Application of Hierarchical Reinforcement Learning**    
[Malcolm Ryan][mal] and Mark Reid    
International Conference on Machine Learning (ICML 2000)    
{ [PDF][icml00] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Hierarchical reinforcement learning promises to be the key to scaling reinforcement learning methods to large, complex, real-world problems. Many theoretical models have been proposed but so far there has been little in the way of empirical work published to demonstrate these claims.

In this paper we begin to fill this void by demonstrating the application of the RL-TOPs hierarchical reinforcement learning system to the problem of learning to control an aircraft in a flight simulator. We explain the steps needed to encode the background knowledge for this domain and present experimental data to show the success of this technique.
 </div>

 <div class="bibtex">
### BibTeX
	@inproceedings{Ryan:2000,
	 Author = {Ryan, Malcolm and Reid, Mark D.},
	 Booktitle = {Proceedings of the 17th International Conference on Machine Learning (ICML)},
	 Pages = {807--814},
	 Title = {Learning to Fly: An Application of Hierarchical Reinforcement Learning},
	 Year = {2000}}
 </div>


## 1999
**NRMIS: A Noise Resistant Model Inference System**    
[Eric McCreath][eric] and Mark Reid    
Discovery Science (DS 1999)    
{ [PDF][ds99] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Within the empirical ILP setting we propose a method of inducing definite programs from examples -- even when those examples are incomplete and occasionally incorrect. This system, named NRMIS, is a top-down batch learner that can make use of intensional background knowledge and learn programs involving multiple target predicates. It consists of three components: a generalization of Shapiro's contradiction backtracing algorithm; a heuristic guided search of refinement graphs; and a LIME-like theory evaluator. Although similar in spirit to MIS, NRMIS avoids its dependence on an oracle while retaining the expressiveness of a hypothesis language that allows recursive clauses and function symbols. NRMIS is tested on domains involving noisy and sparse data. The results illustrate NRMIS's ability to induce accurate theories in all of these situations.
</div>

 <div class="bibtex">
### BibTeX

	@inproceedings{McCreath:1999,
	 Author = {McCreath, Eric and Reid, Mark D.},
	 Booktitle = {Discovery Science},
	 Pages = {252--263},
	 Title = {NRMIS: A Noise Resistant Model Inference System},
	 Year = {1999}}
 </div>



</div>

[julieanne]: http://cass.anu.edu.au/humanities/school_sites/staffmod.php
[eric]: http://cs.anu.edu.au/~Eric.McCreath/
[bob]: http://axiom.anu.edu.au/~williams/
[novi]: http://users.rsise.anu.edu.au/~nquadrianto/
[mal]: http://www.cse.unsw.edu.au/~malcolmr/
[wray]: http://nicta.com.au/people/buntinew
[tiberio]: http://www.tiberiocaetano.com/
[kristian]: http://www-kd.iai.uni-bonn.de/index.php?page=people_details&id=21
[javen]: http://users.cecs.anu.edu.au/~qshi/
[tim]: http://homepages.cwi.nl/~erven/
[nikete]: http://www.nikete.com/
[ejm]: https://researchers.anu.edu.au/researchers/montgomery-ej
[raf]: http://www.cs.berkeley.edu/~raf/
[peng]: http://ivg.au.tsinghua.edu.cn/index.php?n=People.PengSun
[jie]: http://www.tsinghua.edu.cn/publish/auen/1713/2011/20110506105532098625469/20110506105532098625469_.html
[dario]: https://sites.google.com/site/dariogg83/
[avi]: http://cs.anu.edu.au/user/4381
[jamesp]: http://users.cecs.anu.edu.au/~jpetterson/
[peter]: http://homepages.cwi.nl/~pdg/
[mindika]: https://cs.anu.edu.au/user/4382
[brendan]: https://cs.anu.edu.au/user/4806
[peng]: http://ivg.au.tsinghua.edu.cn/index.php?n=People.PengSun
[jie]: http://www.tsinghua.edu.cn/publish/auen/1713/2011/20110506105532098625469/20110506105532098625469_.html
[anton]: http://cs.adelaide.edu.au/~hengel/
[zhenhau]: http://cs.adelaide.edu.au/~zhenhua/
[nishant]: http://users.cecs.anu.edu.au/~nmehta/





## Book Chapters
<div class="section">
## 2010

**Generalization Bounds**    
Mark D. Reid     
To appear in the [Encyclopedia of Machine Learning](http://www.springer.com/computer/ai/book/978-0-387-30768-8), 
November, 2010.    
{ [PDF (Pre-print)][bounds] | [BibTeX]() }

 <div class="bibtex">
### BibTeX
	@incollection{Reid:2010a,
	 Author = {Reid, Mark D.},
	 Booktitle = {Encyclopedia of Machine Learning},
	 Editor = {Sammut, C. and Webb, G.},
	 Publisher = {Springer},
	 Title = {Generalization Bounds},
	 Volume = {XXVI},
	 Year = {2010}}
 </div>

**Squinting at a Sea of Dots: Visualising
Australian Readerships using Statistical Machine Learning**     
[Julieanne Lamond][julieanne] and Mark D. Reid   
Resourceful Reading: The New Empiricism, eResearch and Australian Literary Culture    
{ [BibTeX]() }

 <div class="bibtex">
### BibTeX
	@incollection{Lamond:2010,
	 Address = {Sydney},
	 Author = {Lamond, Julieanne V. and Reid, Mark D.},
	 Booktitle = {Resourceful Reading: The New Empiricism, eResearch and Australian Literary Culture},
	 Editor = {Bode, Katherine and Dixon, Robert},
	 Pages = {223--239},
	 Publisher = {Sydney University Press},
	 Title = {Squinting at a Sea of Dots: Visualising Australian Readerships using Statistical Machine Learning},
	 Year = {2010}}

 </div>

</div>




## Refereed Workshops
<div class="section">

## 2014

**Risk Dynamics in Trade Networks**    
[Rafael M. Frongillo][raf] and Mark D. Reid    
[Workshop on Transactional Machine Learning and E-Commerce][trans14workshop] at NIPS 2014    
{ [PDF][trans14] | [Abstract]() }

 <div class="abstract">
### Abstract

We introduce a new framework to model interactions among agents which seek to trade to minimize their risk with respect to some future outcome. We quantify this risk using the concept of risk measures from finance, and introduce a class of trade dynamics which allow agents to trade contracts contingent upon the future outcome. We then show that these trade dynamics exactly correspond to a variant of randomized coordinate descent. By extending the analysis of these coordinate descent methods to account for our more organic setting, we are able to show convergence rates for very general trade dynamics, showing that the market or network converges to a unique steady state. Applying these results to prediction markets, we expand on recent results by adding convergence rates and general aggregation properties. Finally, we illustrate the generality of our framework by applying it to agent interactions on a scale-free network.

 </div>

[trans14workshop]: http://workshops.inf.ed.ac.uk/ml/nipstransactional/
[trans14]: /bits/pubs/trans14.pdf


**Randomized Subspace Descent**    
[Rafael M. Frongillo][raf] and Mark D. Reid    
[Workshop on Optimization for Machine Learning][optml14workshop] at NIPS 2014    
{ [PDF][optml14] | [Abstract]() }

 <div class="abstract">
### Abstract

We develop a generalization of randomized coordinate descent for smooth convex problems, where the coordinates specify arbitrary subspaces, and derive standard O(1/ε) and O(1/ log ε) rates. For the special case of overlapping 2-block sub- spaces (i.e. graphs), which has received attention in the literature recently, we derive a convergence rate on a given graph in terms of its algebraic connectivity. Using this connection, we introduce bounds for graph topologies not previously considered. We conclude with preliminary progress toward the interesting open question: what is the best network structure for a given optimization problem?

 </div>

[optml14workshop]: http://opt-ml.org
[optml14]: /bits/pubs/optml14.pdf



## 2012
**Interpreting Prediction Markets: A Stochastic Approach**    
[Rafael Frongillo][raf], [Nicolás Della Penna][nikete], and Mark D. Reid    
Workshop on [Markets, Mechanisms, and Multi-Agent Models][mmmam12workshop] at ICML 2012    
{ [PDF][mmmam12] | [Abstract]() }

 <div class="abstract">
### Abstract
We study the stochastic sequence of prices that results from traders with beliefs drawn from a given distribution sequentially interacting with an automated market maker. We relate this model to the classic market equilibrium analysis, as well as to the more recent line of research seeking to interpret prediction market prices. Along the way, we show a very natural stochastic market model which exactly corresponds to a stochastic mirror descent, and we leverage this new connection to make claims about the behaviour of the market.
 </div>

[mmmam12workshop]: http://icml2012marketswkshop.pbworks.com/
[mmmam12]: /bits/pubs/mmmam12.pdf


## 2011
**Bandit Market Makers**    
[Nicolás Della Penna][nikete] and Mark D. Reid    
Poster at the [Second Workshop on Computational Social Science and the Wisdom of Crowds][css11workshop] at NIPS 2011    
{ [PDF][css11] | [Abstract]() }

 <div class="abstract">
### Abstract
We propose a flexible framework for profit-seeking market making by combining cost function based automated market makers with bandit learning algorithms. The key idea is to consider each parametrisation of the cost function as a bandit arm, and the minimum expected profits from trades executed during a period as the rewards. This allows for the creation of market makers that can adjust liquidity and bid-asks spreads dynamically to maximise profits.
 </div>

[css11workshop]: http://www.cs.umass.edu/~wallach/workshops/nips2011css/
[css11]: http://www.cs.umass.edu/~wallach/workshops/nips2011css/papers/Penna.pdf

**Anatomy of a Learning Problem**    
Mark D. Reid, [James Montgomery][ejm], and Mindika Premachandra    
Talk at the [Relations Between Machine Learning Problems][rml11workshop] Workshop at NIPS 2011.    
{ [PDF][rml11] | [Abstract]() | [Slides][rml11slides] | [Video][rml11video] }    

 <div class="abstract">
### Abstract
In order to relate machine learning problems we argue that we need to be able to articulate what is meant by a single machine learning problem. By attempting to name the various aspects of a learning problem we hope to clarify ways in which learning problems might be related to each other. We tentatively put forward a proposal for an anatomy of learning problems that will serve as scaffolding for posing questions about relations. After surveying the way learning problems are discussed in a range of repositories and services. We then argue that the terms used to describe problems to better understand a range of viewpoints within machine learning ranging from the theoretical to the practical.
 </div>

[rml11]: /bits/pubs/nips11ws.pdf 
[rml11workshop]: http://rml.cecs.anu.edu.au/
[rml11video]: http://videolectures.net/nipsworkshops2011_reid_anatomy/
[rml11slides]: http://videolectures.net/site/normal_dl/tag=658116/nipsworkshops2011_reid_anatomy_01.pdf

</div>


## Thesis
<div class="section">
## 2007
**DEFT Guessing: Using Inductive Transfer to Improve Rule Evaluation from Limited Data**     
Mark D. Reid    
School of Computer Science and Engineering, The University of New South Wales, 
Sydney, Australia.   
{ [PDF][unsw07] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Algorithms that learn sets of rules describing a concept from its examples have been widely studied in machine learning and have been applied to problems in medicine, molecular biology, planning and linguistics. Many of these algorithms used a separate-and-conquer strategy, repeatedly searching for rules that explain different parts of the example set. When examples are scarce, however, it is difficult for these algorithms to evaluate the relative quality of two or more rules which ﬁt the examples equally well. 

This dissertation proposes, implements and examines a general technique for modifying rule evaluation in order to improve learning performance in these situations. This approach, called Description-based Evaluation Function Transfer (Deft), adjusts the way rules are evaluated on a target concept by taking into account the performance of similar rules on a related support task that is supplied by a domain expert. Central to this approach is a novel theory of task similarity that is deﬁned in terms of syntactic properties of rules, called descriptions, which define what it means for rules to be similar. Each description is associated with a prior distribution over classification probabilities derived from the support examples and a rule’s evaluation on a target task is combined with the relevant prior using Bayes’ rule. Given some natural conditions regarding the similarity of the target and support task, it is shown that modifying rule evaluation in this way is guaranteed to improve estimates of the true classification probabilities. 

<p> Algorithms to efficiently implement Deft are described, analysed and used to measure the effect these improvements have on the quality of induced theories. Empirical studies of this implementation were carried out on two artiﬁcial and two real-world domains. The results show that the inductive transfer of evaluation bias based on rule similarity is an effective and practical way to improve learning when training examples are limited.</p>
 </div>

 <div class="bibtex">
### BibTeX
	@phdthesis{Reid:2007,
	 Address = {Sydney, Australia},
	 Author = {Reid, Mark D.},
	 School = {University of New South Wales},
	 Title = {DEFT Guessing: Using Inductive Transfer to Improve Rule Evaluation from Limited Data},
	 Year = {2007}}
 </div>

</div>

## Unrefereed Technical Reports
<div class="section">

## 2015

**Fast rates in statistical and online learning**    
[Tim van Erven][tim], [Peter D. Grünwald][peter], [Nishant A. Mehta][nishant], Mark D. Reid and [Robert C. Williamson][bob]    
{ [arXiv](http://arxiv.org/abs/1507.02592) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
The pursuit of fast rates in online and statistical learning has led to the conception of many conditions in learning theory under which fast learning is possible. We show that most of these conditions are special cases of a single, unifying condition, that comes in two forms: the central condition for 'proper' learning algorithms that always output a hypothesis in the given model, and stochastic mixability for online algorithms that may make predictions outside of the model. We show that, under surprisingly weak conditions, both conditions are, in a certain sense, equivalent. The central condition has a re-interpretation in terms of convexity of a set of pseudoprobabilities, linking it to density estimation under misspecification. For bounded losses, we show how the central condition enables a direct proof of fast rates and we prove its equivalence to the Bernstein condition, itself a generalization of the Tsybakov-Mammen margin condition, which has played a central role in obtaining fast rates in statistical learning. Yet, while the Bernstein condition is two-sided, the central condition is one-sided, making it more suitable to deal with unbounded losses. In its stochastic mixability form, our condition generalizes both a stochastic exp-concavity condition identified by Juditsky, Rigollet and Tsybakov, and Vovk's notion of mixability. Our unifying conditions thus provide a significant step towards a characterization of fast rates in statistical learning, similar to how classical mixability characterizes constant regret in the sequential prediction with expert advice setting.
 </div>

 <div class="bibtex">
### BibTeX
    @article{vanErven:2015,
	 author = {{van Erven}, T. and Gr\"unwald, P.D. and Mehta, N.A. and Reid, M.D. and Williamson, R.C.},
	 title = {Fast rates in statistical and online learning},
	 journal = {arXiv:1507.02592 [cs.LG]},
	 year = {2015},
	 month = {July}}
 </div>

## 2014

**Risk Dynamics in Trade Networks**    
[Rafael M. Frongillo][raf] and Mark D. Reid    
{ [arXiv](http://arxiv.org/abs/1410.0413) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We introduce a new framework to model interactions among agents which seek to trade to minimize their risk with respect to some future outcome. We quantify this risk using the concept of risk measures from finance, and introduce a class of trade dynamics which allow agents to trade contracts contingent upon the future outcome. We then show that these trade dynamics exactly correspond to a variant of randomized coordinate descent. By extending the analysis of these coordinate descent methods to account for our more organic setting, we are able to show convergence rates for very general trade dynamics, showing that the market or network converges to a unique steady state. Applying these results to prediction markets, we expand on recent results by adding convergence rates and general aggregation properties. Finally, we illustrate the generality of our framework by applying it to agent interactions on a scale-free network.
 </div>

 <div class="bibtex">
### BibTeX
    @techreport{Frongillo:2014,
	 Author = {Frongillo, Rafael M and Reid, Mark D},
     Institution = {arXiv:1410.0413},
	 Title = {Risk Dynamics in Trade Networks},
	 Year = {2014}}
 </div>

**Generalized Mixability via Entropic Duality**    
Mark D. Reid, Rafael M. Frongillo, Robert C. Williamson, and Nishant Mehta    
{ [arXiv](http://arxiv.org/abs/1406.6130) | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
Mixability is a property of a loss which characterizes when fast convergence is possible in the game of prediction with expert advice. We show that a key property of mixability generalizes, and the exp and log operations present in the usual theory are not as special as one might have thought. In doing this we introduce a more general notion of Φ-mixability where Φ is a general entropy (_i.e._, any convex function on probabilities). We show how a property shared by the convex dual of any such entropy yields a natural algorithm (the minimizer of a regret bound) which, analogous to the classical aggregating algorithm, is guaranteed a constant regret when used with Φ-mixable losses. We characterize precisely which Φ have Φ-mixable losses and put forward a number of conjectures about the optimality and relationships between different choices of entropy.
 </div>

 <div class="bibtex">
### BibTeX
    @techreport{Reid:2014,
	 Author = {Reid, Mark D and Frongillo, Rafael M and Williamson, Robert C and Mehta, Nishant},
     Institution = {arXiv:1406.6130},
	 Title = {Generalized mixability via entropic duality},
	 Year = {2014}}
 </div>

## 2011

**PSI Draft Specification**    
Mark D. Reid, James Montgomery, and Barry Drake    
{ [Project Site][psi] | [Specification][psi-spec] | [Abstract]() }

 <div class="abstract">
### Abstract
The Protocols and Structures for Inference (PSI) project aims to develop an architecture for presenting machine learning algorithms, their inputs (data) and outputs (predictors) as resource-oriented RESTful web services1 in order to make machine learning technology accessible to a broader range of people than just machine learning researchers.

Currently, many machine learning implementations (e.g., in toolkits such as Weka, Orange, Elefant, Shogun, SciKit.Learn, etc.) are tied to specific choices of programming language, and data sets to particular formats (e.g., CSV, svmlight, ARFF). This limits their accessability, since new users may have to learn a new programming language to run a learner or write a parser for a new data format, and their interoperability, requiring data format converters and multiple language platforms. To address these limitations, the aim of the PSI service architecture is to present the main inferential entities – relations, attributes, learners, and predictors – as web resources that are accessible via a common interface. By enforcing a consistent interface for the entities involved in learning, interoperability is improved and irrelevant implementation details can be hidden to promote accessibility.
 </div>


## 2010

**Conditional Random Fields and Support Vector Machines: A Hybrid Approach**    
[Qinfeng Shi][javen], Mark D. Reid, and [Tiberio Caetano][tiberio]    
arXiv:1009.3346 \[cs.LG\]    
{ [arXiv][arxiv10] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We propose a novel hybrid loss for multiclass and structured prediction problems that is a convex combination of log loss for Conditional Random Fields (CRFs) and a multiclass hinge loss for Support Vector Machines (SVMs). We provide a sufficient condition for when the hybrid loss is Fisher consistent for classification. This condition depends on a measure of dominance between labels - specifically, the gap in per observation probabilities between the most likely labels. We also prove Fisher consistency is necessary for parametric consistency when learning models such as CRFs. 

We demonstrate empirically that the hybrid loss typically performs as least as well as - and often better than - both of its constituent losses on variety of tasks. In doing so we also provide an empirical comparison of the efficacy of probabilistic and margin based approaches to multiclass and structured prediction and the effects of label dominance on these results.
 </div>

 <div class="bibtex">
### BibTeX
	@misc{Shi:2010,
	 Author = {Shi, Qinfeng and Reid, Mark D. and Caetano, Tib{\'e}rio S.},
	 Howpublished = {arXiv:1009.3346v1 [cs.LG]},
	 Month = {September},
	 Title = {Conditional Random Fields and Support Vector Machines: A Hybrid Approach},
	 Year = {2010}}
 </div>

## 2009
**Information, Divergence and Risk for Binary Experiments**        
Mark D. Reid and [Robert C. Williamson][bob]    
arXiv:0901.0356v1 \[stat.ML\]    
{ [arXiv][arxiv09] | [Abstract]() | [BibTeX]() }

 <div class="abstract">
### Abstract
We unify f-divergences, Bregman divergences, surrogate loss bounds (regret bounds), proper scoring rules, matching losses, cost curves, ROC-curves and information. We do this by systematically studying integral and variational representations of these objects and in so doing identify their primitives which all are related to cost-sensitive binary classification. As well as clarifying relationships between generative and discriminative views of learning, the new machinery leads to tight and more general surrogate loss bounds and generalised Pinsker inequalities relating f-divergences to variational divergence. The new viewpoint illuminates existing algorithms: it provides a new derivation of Support Vector Machines in terms of divergences and relates Maximum Mean Discrepancy to Fisher Linear Discriminants. It also suggests new techniques for estimating f-divergences.
 </div>

 <div class="bibtex">
### BibTeX
	@misc{Reid:2009c,
	 Author = {Reid, Mark D. and Williamson, Robert C.},
	 Howpublished = {arXiv:0901.0356v1 [stat.ML]},
	 Month = {January},
	 Title = {Information, Divergence and Risk for Binary Experiments},
	 Year = {2009}}
 </div>

</div>

## Patents
<div class="section">
## 2006

**Determining Page Complexity**    
Barry James Drake and Mark Darren Reid    
Australian Application Number: 2006252174    
{ [Entry][pat06] }

</div>

[jmlr15-pdf]:http://jmlr.org/papers/volume16/vanerven15a/vanerven15a.pdf 
[jmlr15]: http://jmlr.org/papers/v16/vanerven15a.html

[papis15]: http://www.papis.io/2015/
[papis-psi15]: http://lanyrd.com/2015/papis2015/sdpfzg/

[nips15]: https://nips.cc/Conferences/2015/AcceptedPapers

[colt15-gen-mix]: /bits/pubs/colt15.pdf
[colt15]: http://jmlr.csail.mit.edu/proceedings/papers/v40/

[mlj14-aoso]: /bits/pubs/mlj14-aoso.pdf

[maxent13]: http://www.maxent2013.org
[maxent13-convex-gefs]: /bits/pubs/maxent13-convex-gefs.pdf
[maxent13-update-gefs]: /bits/pubs/maxent13-update-gefs.pdf

[acml13]: http://acml2013.conference.nicta.com.au
[acml13-minitrade]: /bits/pubs/acml13-minitrade.pdf

[bounds]: http://dl.dropbox.com/u/38668/Papers/Generalization_Bounds.pdf
[aistats2010]: http://aistats.org/
[aistats10]: http://jmlr.csail.mit.edu/proceedings/papers/v9/reid10a/reid10a.pdf

[icdm09]: /bits/pubs/icdm09.pdf
[procicdm]: http://www.cs.umbc.edu/ICDM09/program.html

[colt09]: /bits/pubs/colt09.pdf
[colt09slides]: http://users.rsise.anu.edu.au/~mreid/files/slides/COLT2009.pdf
[proccolt09]: http://www.cs.mcgill.ca/~colt2009/proceedings.html
[colt11]: /bits/pubs/colt11.pdf 
[colt11video]: http://videolectures.net/colt2011_williamson_risk/
[proccolt2011]: http://colt2011.sztaki.hu/accepted_papers.html

[nips11]: /bits/pubs/nips11.pdf
[procnips2011]: http://nips.cc/Conferences/2011/Program/accepted-papers.php

[nips12]: http://nips.cc/Conferences/2012/
[nips12-stochmix]: /bits/pubs/nips12-stochmix.pdf
[nips12-markets]: /bits/pubs/nips12-markets.pdf

[ci12]: /bits/pubs/ci12.pdf
[procci2012]: http://www.ci2012.org/accepted-papers

[icml12]: http://icml.cc/2012/
[icml12-fdiv]: /bits/pubs/icml12-fdiv.pdf
[icml12-aoso]: /bits/pubs/icml12-aoso.pdf
[icml12-multi]: /bits/pubs/icml12-multi.pdf

[icml09]: /bits/pubs/icml09.pdf
[icml09slides]: http://users.rsise.anu.edu.au/~mreid/files/slides/ICML2009.pdf
[procicml09]: http://www.cs.mcgill.ca/~icml2009/abstracts.html

[unsw07]: /bits/pubs/unsw07.pdf
[isj01]: /bits/pubs/isj02.pdf
[ilp04]: /bits/pubs/ilp04.pdf
[ilp00]: /bits/pubs/ilp00.pdf
[icml00]: /bits/pubs/icml00.pdf
[ds99]: /bits/pubs/ds99.pdf

[psi]: http://psi.cecs.anu.edu.au/
[psi-spec]: http://psi.cecs.anu.edu.au/spec/index.html

[pat06]: http://pericles.ipaustralia.gov.au/ols/searching/patsearch/search_section.jsp?sectionCode=DTL&keyNo=2006252174&type=S

[arxiv09]: http://arxiv.org/abs/0901.0356
[arxiv10]: http://arxiv.org/abs/1009.3346

[scholar]: http://scholar.google.com/citations?hl=en&user=H2dgqTYAAAAJ

<script type="text/javascript" src="/js/jquery.js"> </script>
<script type="text/javascript">
	$(document).ready(function(){
		$("a:contains('BibTeX')").click(function(event) { 
			$(this).parent().nextAll(".bibtex").first().slideToggle("fast"); });

		$("a:contains('BibTeX')").toggle(
			function(){ $(this).text("Hide BibTeX") },
			function(){ $(this).text("BibTeX") }
		);

		$("a:contains('Abstract')").click(function(event) { 
			$(this).parent().nextAll(".abstract").first().slideToggle("fast"); });

		$("a:contains('Abstract')").toggle(
			function(){ $(this).text("Hide Abstract") },
			function(){ $(this).text("Abstract") }
		);

	});
</script>

