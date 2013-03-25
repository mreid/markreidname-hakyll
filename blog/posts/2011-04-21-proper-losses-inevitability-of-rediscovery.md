---
title: Proper Losses and the Inevitability of Rediscovery
excerpt: I recently discovered that a result concerning probability estimation in one of my recent papers was already observed by Lindley 28 years prior.
location: Darwin, Australia
---

Suppose you have trained a real-valued binary predictor $h$ using some learning algorithm. When is it reasonable to relate the real number $h(x)$ to the probability $P(y=1|x)$, that is, the probability of $x$ having a positive label?

While there have been quite a few proposed answers to this question, they tend to focus on providing answers for specific techniques, showing how to modify SVM or boosting algorithms or their outputs to obtain probabilities[^1].
In our recent paper, _[Composite Binary Losses][]_, [Bob Williamson][] and I took a more problem-oriented look at this question (amongst others). 
Rather than looking at specific techniques, we focused on the loss function that a learner attempts to minimise. 
By exploiting existing results about [proper losses][] we were able to characterise which losses allow the output of a classifier to be transformed into consistent probability estimates.


## Proper Composite Losses
A loss for probability estimation $\ell$ is one that assigns a penalty $\ell(y,q)$ when $q$ is the estimate of the probability that some $x$ has label 1 when $x$ is actually classified as $y \in \{-1,1\}$. For example, square loss has $\ell(1,q) = (1-q)^2$ and $\ell(0,q) = q^2$. A _proper loss_ additionally requires that its conditional expected loss $L(p,q) := \mathbb{E}_{y\sim p} [\ell(y,q)]$ is minimised when $q=p$, that is, if the true conditional probability of $y=1$ is estimated correctly.

De Finetti, McCarthy, and Savage[^2] were among the first to observe that this innocuous little condition was the "right" one to ask of losses for probability estimation.
That being the case, the original question of interpreting the real-valued output of a predictor can be reduced to asking when there exists an inveritble function $\psi^{-1}$ that maps real numbers into the interval $[0,1]$.
If such a function exists, we can then ask when a loss $\lambda(y,v)$ for real-valued outputs $v$ can be expressed as the composition of a proper loss $\ell$ and the mapping $\psi^{-1}$. 
That is, when can we write $\lambda(y,v) = \ell(y, \psi^{-1}(v))$ for some proper loss $\ell$?

Corollary 12 in my paper with Bob states that a suitably differentiable $\lambda$ can the decomposed in this way if and only if 
$$ \displaystyle 
	\psi^{-1}(v) = \frac{\lambda'_{-1}(v)}{\lambda'_{-1}(v) - \lambda'_1(v)}.
$$
where $\lambda_y(v)$ is shorthand for $\lambda(y,v)$.

This very simple characterisation means you can do a simple calculation to determine whether or not your trained classifier can give consistent probability estimates or not. If your classifier $h$ was trained by minimising a loss which makes the above equation is well-defined then you can interpret $\psi^{-1}(h(x))$ as a probability, otherwise you cannot. For example, the exponential loss minimsed by AdaBoost does satisfy the above condition, while the hinge loss used by SVMs does not.


## Lindley's Lemma
The proof of the above result follows almost directly from the definition of composite losses and properness. 
I am always a little suspicious when an answer to a fairly fundamental question is so easily obtained.[^3]
In this case my suspicions were justified since we were not the first to state this result: 
[Dennis Lindley][] had also noticed this in his paper from 1982, _[Scoring Rules and the Inevitability of Probability][]_.

His Lemma 1 can be paraphrased as:

> Given a _score function_ $f(X,E)$ that satisfies some assumptions regarding its admissibility, 
> origin and scale, regularity, it is possible to define a function
> $$ \displaystyle 
>	P(x) = \frac{f'(x,0)}{f'(x,0) - f'(x,1)}
> $$
> for $x\in[x_F, x_T]$ such that $P(x)\in[0,1]$ is continuous and $P(x_F)=0$, $P(x_T)=1$.

That should look familiar...

Given Lindley's prominence and the fact the title of his paper contains "scoring rules", I'm a little embarassed we hadn't found his version of the result before we rediscovered it. Hopefully this post goes some way to addressing the oversight.

[^1]: For example, see the overview in John Platt's _[Probabilities for SV Machines][]_.
[^2]: Savage, _[Elicitation of Personal Probabilities and Expectations][]_, JASA, 1971.
[^3]: I had a similar gut feeling that was justified when I was exploring [the Compression Lemma][].

[proper losses]: http://mark.reid.name/iem/proper-losses.html
[Dennis Lindley]: http://en.wikipedia.org/wiki/Dennis_Lindley
[probabilities for sv machines]: http://research.microsoft.com/apps/pubs/default.aspx?id=69187
[Bob Williamson]: http://users.cecs.anu.edu.au/~williams/
[composite binary losses]: http://jmlr.csail.mit.edu/papers/v11/reid10a.html
[scoring rules and the inevitability of probability]: http://www.jstor.org/stable/1402448
[elicitation of personal probabilities and expectations]: http://www.jstor.org/pss/2284229
[the compression lemma]: http://mark.reid.name/iem/a-compression-lemma.html

