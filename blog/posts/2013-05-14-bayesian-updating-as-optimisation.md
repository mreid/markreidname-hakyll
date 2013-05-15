---
title: Bayesian Updating as Regularised Optimisation
excerpt: A brief description and discussion of Zhu et al.'s RegBayes framework for generalising Bayesian updating.
location: Canberra, Australia
---

I recently attended a workshop at [Tsinghua University][] in Beijing on social networking and machine learning. One of the more machine learning focused talks by [Jun Zhu][] caught my attention with a simple but surprising generalisation of Bayesian updating which he and his co-authors call "Regularized Bayesian Inference" or [RegBayes][].

The core idea is very simple: express classical Bayesian updating as an optimisation problem (see below) and then add constraints and regularisers to the posterior distribution. The advantage to this approach is that it affords an extra way to encode domain knowledge about problems.

The closest thing I'd seen to something like output regularisation was in a 2007 JMLR paper, _[Value Regularization and Fenchel Duality][rifkin07]_ by Rifkin & Lippert.[^1] However, RegBayes specifically starts with Bayesian updating and regularises distributions instead of just values.

I really like seeing new takes on old ideas, so I thought I'd work through the representation of updating as optimisation. The derivation below is an expansion of what is worked through in Section 3.1 of a recent paper by Zhu, Chen, and Xing titled _[Bayesian Inference with Posterior Regularization and Infinite Latent SVMs][arxiv]_. Interested readers can also find an extended discussion, applications and connections with earlier work there.

## Bayesian Updating as Divergence Optimisation

\newcommand{\M}{\mathcal{M}}
\newcommand{\Q}{\mathcal{Q}}
\newcommand{\E}{\mathbb{E}}

We'll start by letting $\M$ be a set of models and $\Delta_\M$ the set of distributions over $\M$. If $\pi(M)$ denotes the prior probability of a model $M \in \M$ and $p(D|M)$ denote the data likelihood for $D$ given $M$ then, as everyone knows, Bayes' rule states that the posterior $p(M|D)$ can be computed via
$$
	p(M|D) = \frac{\pi(M) p(D|M)}{p(D)}
$$
where $p(D)$ is the marginal distribution over the data.

Now, it is well known that the [KL divergence][] from a distribution $p$ to a distribution $q$ -- denoted $KL(q\|p)$ -- is minimised and equal to zero when, and only when, $q = p$ (almost everywhere). This means that if we had some arbitrary distribution $q(M)$ over models and wanted to ensure it was equal to the posterior distribution $p(M|D)$ obtained by updating a prior $\pi$ with data $D$ we could do so in a round-about sort of way by solving the following optimisation problem:
$$ \begin{equation} \inf_{q(M)}\ KL(q(M)\|p(M|D))\quad \text{s.t.}\quad  q \in \Delta_\M.\label{eq:kl} \end{equation}
$$
Although this is not a particularly interesting optimisation problem, things get a little more interesting if we expand the KL divergence term.
Letting $p_L = p(D|M)$ denote the data likelihood and $p_D = p(D)$ the data marginal we see that
$$ 
	KL\left(q\|\frac{\pi p_L}{p_D}\right) 
	= \E_q\left[\ln\frac{q}{\pi p_L / p_D}\right]
	= \E_q\left[\ln \frac{q}{\pi} - \ln p_L + \ln p_D\right]
$$
and so the $KL$ term in the optimisation problem above can be written as
$$ \begin{align*} KL(q(M)\|p(M|D)) &= KL(q(M)\|\pi(M) p(D|M) / p(D)) \\ &= KL(q(M)\|\pi(M)) - \E_{M\sim q}\left[ \ln p(D|M) \right] + \ln p(D) \end{align*} $$
since $p(D)$ does not depend on $M$.
The $\ln p(D)$ term is also irrelevant for the optimisation in \\eqref{eq:kl} so we can now express that problem as
$$
	\inf_{q(M)}\ 
		\underbrace{KL(q(M)\|\pi(M))}_{\text{closeness to prior}} 
		+ 
		\underbrace{\E_{M\sim q}\left[ -\ln p(D|M) \right]}_{\text{fit to data}}
		\quad 
		\text{s.t.}\quad  q \in \Delta_\M.
$$

The nice thing about expressing the posterior as the solution of the above problem is that we can see the Bayesian updating as a trade-off between staying close to the prior and fitting the data. The KL term keeps the posterior close to the prior while the other term measures the expected log loss of the model's ability to predict the data.


## Adding in Regularisation

The interesting insight Jun and his co-authors had was that the above optimisation problem can be tweaked slightly by adding either extra constraints to where $q$ can lie in $\Delta_\M$ or by adding an additional regularisation term $U(q)$ which may or may not depend on the data. In its most general setting, updating a prior $\pi$ given data $D$ can be written as
$$
	\inf_{q(M)}\ KL(q(M)\|\pi(M)) + \E_q\left[-\ln p(D|M)\right] + U(q(M))
	\quad
	\text{s.t.}\quad q\in\Q
$$
where $U$ is a regulariser and $\Q \subseteq \Delta_\M$ are the allowable distributions.
The distribution $q(M)$ solving the above problem is called the "post-data distribution" to distinguish it from the traditional posterior distribution. 


## Questions 

One question that sprung to mind when I first saw this was whether this setting is strictly more general than normal Bayesian updating. The regularisation and constraints control which post-data distribution is selected but could such a post-data distribution be achieved as the posterior of normal Bayesian updating for a different prior?

It turns out the answer is "no". Since the regulariser $U$ can depend on the data, it is possible to create updating schemes that are not doing strict Bayesian updating. I'm not sure whether the same holds if $U$ and $\Q$ are not allowed to depend on the data but I suspect RegBayes would still be more general. 

Some other questions that came up in my discussions with Jun included:

- What sort of convergence and consistency guarantees can be given for this scheme?
- Could there be connections between RegBayes and PAC-Bayesian theory? 
- Could KL divergence and log loss be replaced by other [loss/divergence pairs][idr]?
- Do some choices of regulariser yield updates for non-standard uncertainty calculi?

I haven't yet spent much time thinking about these but I find this approach a fascinating way to couch the problem of managing uncertainty.

[tsinghua university]: http://www.tsinghua.edu.cn/publish/csen/
[jun zhu]: http://www.ml-thu.net/~jun/
[regbayes]: http://www.ml-thu.net/~jun/research.shtml
[arxiv]: http://arxiv.org/abs/1210.1766v2
[rifkin07]: http://jmlr.csail.mit.edu/papers/v8/rifkin07a.html
[kl divergence]: http://en.wikipedia.org/wiki/Kullback–Leibler_divergence
[idr]: http://jmlr.csail.mit.edu/papers/v12/reid11a.html

[^1]: In [their paper][arxiv], Jun Zhu et al. point out a number of other, earlier works that inspired RegBayes but I had either not seen them or made the connection to Bayesian updating before.
