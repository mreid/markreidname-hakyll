---
title: The Compression Lemma
excerpt: A brief discussion and proof of this very elegant and powerful result of Banerjee's.
location: Canberra, Australia
---

I recently re-read an ICML 2006 paper called _[On Bayesian Bounds][obb]_ by [Arindam Banerjee][ab] that has at its core a very elegant and general result. I spent a bit of time trying to carefully understand it and thought I would write up my take on it. Here's a slight restatement of the key result.

> **Compression Lemma** (Banerjee, 2006)    
> For any function $\phi : X \to \mathbb{R}$ and any pair of 
> distributions $P$ and $Q$ over $X$ we have
> $$ 
>	\mathbb{E}_Q\left[\phi(x)\right] - \log \mathbb{E}_P\left[e^{\phi(x)}\right]
>	\le KL(Q\|P)
> $$
> where $KL(Q\|P) = \mathbb{E}_Q\left[\log\frac{dQ}{dP}\right]$ is 
> the [Kulback-Leibler divergence][kl] from $P$ to $Q$.
> Furthermore, the bound is achieved for $\phi(x) = \log\frac{dQ}{dP}(x)$.

Notice that there are no restrictions placed on the choice of the function (aside from implicit measurability) or the distributions. The fact that this inequality holds so broadly is the reason Banerjee is able to use it to derive a [PAC-Bayesian bound][pbb] and other related bounds in online learning. I won't go into these here but it is worth looking at the paper to see how easily these are derived through a judicious choice of $\phi$.

The reason for the name _compression lemma_ is not apparent at first. Indeed, apart from the presence of the KL divergence, there is little to immediately connect it with information theory. Fortunately, the paper does give a way of looking at it that makes this connection clear. 

What follows is my own simplification of the proof given by Banerjee. It uses all the same ideas but simplifies his argument a little.

## A Simple Proof
We need to introduce a slight variant of the KL divergence which, for wont of a better name, I'll call the _relative [cross entropy][ce]_ of distributions $Q$ and $R$ relative to $P$:
$$ 
	C(Q,R\|P) = \mathbb{E}_Q\left[\log \frac{dR}{dP} \right].
$$
The negative relative cross entropy can be interpreted as the expected code length required to encode symbols drawn from $Q$ when using a code based on $R$.

As you can see, the relative cross entropy is equal to the KL divergence when $R=Q$. In fact, we can easily see that
$$ 
	C(Q,R\|P) = KL(Q\|P) - KL(Q\|R)
$$
by noting that 
$\log \frac{dR}{dP} = \log\left( \frac{dR}{dQ}\ \frac{dQ}{dP} \right) = -\log \frac{dQ}{dR} + \log \frac{dQ}{dP}$ and splitting and matching the resulting expectation with the definition of KL divergence.

Since the KL divergence is guaranteed to be non-negative, we see immediately that $C(Q,R\|P) \le KL(Q\|P)$ with equality holding when $KL(Q\|R) = 0$, that is, when $R=Q$.

Now we consider a specific choice of $R$, namely a [Gibbs distribution][gibbs] based on the function $\phi$. Its density relative to $P$ is given by
$$ 
	\frac{dR}{dP}(x) = \frac{1}{Z_{\phi}} e^{\phi(x)} 
$$
where $Z_{\phi} = \mathbb{E}_P\left[ \exp(\phi(x)) \right]$ is just a normalising term. 

Plugging this definition of $R$ into $C(Q,R\|P)$ gives
$$ 
	\mathbb{E}_Q\left[\log\left(Z_{\phi}^{-1}e^{\phi(x)}\right)\right]
	= \mathbb{E}_Q\left[\phi(x)\right] - \log \mathbb{E}_P\left[ e^{\phi(x)} \right]
$$
and since $C(Q,R\|P) \le KL(Q\|P)$ we have proved the first part of the compression lemma. The second part follows by substituting $\phi(x) = \log \frac{dQ}{dP}(x)$ into the definition of the Gibbs distribution $R$ and noting that, in this case, $R = Q$.

## Some Observations
Banerjee makes a number of insightful observations about the compression lemma, including its connection with the class of tight bounds achievable via [Fenchel duality][fd].

One small thing I think my proof adds is a simple quantification of the gap in the compression lemma inequality. Specifically, it is $KL(Q\|R)$---the divergence of $Q$, the distribution generating the data, from $R$, the distribution modelling $Q$. While this doesn't have a simple form when $R$ is a Gibbs distribution for $\phi$ (at least I can't see it) it has straight-forward interpretation. 

[kl]: http://en.wikipedia.org/wiki/Kullback–Leibler_divergence
[ab]: http://www-users.cs.umn.edu/~banerjee/
[obb]: http://www-users.cs.umn.edu/~banerjee/papers/06/icml06fenchel.pdf
[pbb]: http://videolectures.net/aop07_shawe_taylor_pba/
[ee]: http://en.wikipedia.org/wiki/Entropy_encoding
[gibbs]: http://en.wikipedia.org/wiki/Gibbs_measure
[ce]: http://en.wikipedia.org/wiki/Cross_entropy
[fd]: http://en.wikipedia.org/wiki/Fenchel's_duality_theorem
