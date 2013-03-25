---
title: Fisher Information and the Hessian of Log Likelihood 
excerpt: A brief note spelling out a key relationship in information geometry. 
location: Canberra, Australia
---

I've been taking some tentative steps into [information geometry][infogeo] lately which, like all good mathematics, involves sitting alone in a room being confused almost all the time. 

I was not off to a very good start when a seemingly key relationship between Fisher information and the second derivative of the log likelihood eluded me, despite being described as "obvious" or "simple" in [several][watanabe] [books][awari]. I finally figured out the main trick and thought I'd share it here in case someone else has trouble with it (e.g., me in six months).

## Fisher Information

Fisher information is a quantity associated with parametric families of probability distributions. Let $X$ be a set of outcomes and for each parameter $\theta$ in some set $\Theta\subset R^d$ let $p_\theta(x)$ be the distribution over $X$ associated with $\theta$. The _Fisher information_ for the family $P = \{ p_\theta : \theta \in \Theta \}$ is the matrix valued function where the entry[^1] at the $i$th row and $j$th column is
$$
	\displaystyle
	I_{i,j}(\theta) 
	= \mathbb{E}_X
	\left[ 
		\left( D_i \log p_\theta(X) \right) \left( D_j \log p_\theta(X) \right)
	\right]
$$
where the expectation is over the random variable $X$ drawn from the distribution $p_\theta$, and $D_i$ denotes the partial derivative $\frac{\partial}{\partial\theta_i}$. The Fisher information is always symmetric and positive semi-definite and can be seen as measuring the "sensitivity" of the _log likelihood_ $\log p_\theta(x)$ on the outcomes in a neighbourhood of $\theta$.

## ... and the Hessian of log likelihood

The result that had me puzzled for some time was the "obvious" fact that 
$$
	\displaystyle
	I_{i,j}(\theta) 
	= - \mathbb{E}_X 
	\left[ 
		D_{i,j} \log p_\theta(X) 
	\right]
$$
where $D_{i,j}$ denotes the second-order partial derivative $\frac{\partial^2}{\partial\theta_i \partial\theta_j}$. What this says is that the Fisher information is closely related to the curvature of the log likelihood function, as measured by its _Hessian_ -- that is, the matrix of its second derivatives $H[\log p_\theta(x)] = (D_{i,j} \log p_\theta(x))_{i,j=1}^d$. 

After much head-scratching, I realised that the "trick" I was missing was the observation that (under some mild conditions) the second derivatives and integrals can be switched so 
$$
	\displaystyle
	\int_X D_{i,j} p_\theta(X)\,dx 
	= D_{i,j} \int_X p_\theta(X)\,dx 
	= D_{i,j} 1
	= 0
$$
since each $p_\theta$ is a distribution.

With the above identity in hand, establishing the relationship between Fisher information and the Hessian of log likelihood is just an application of the chain and product rules and noting that $D_i \log p_\theta(x) = \frac{D_i p_\theta(x)}{p_\theta(x)}$. Thus,
$$
	\displaystyle
	D_{i,j} \log p_\theta(x)
	= D_i \left( \frac{D_j p_\theta(x)}{p_\theta(x)} \right)
	= \frac{D_{i,j} p_\theta(x)}{p_\theta(x)} 
		- \frac{D_i p_\theta(x)}{p_\theta(x)} \frac{D_j p_\theta(x)}{p_\theta(x)}.
$$

Taking expectations and using the aforementioned trick gives the result since $\mathbb{E}_X \left[ \frac{D_{i,j} p_\theta(x)}{p_\theta(x)} \right] = \int_X  D_{i,j} p_\theta(x)\,dx = 0$.

Everything is obvious in hindsight!

[infogeo]: http://cscs.umich.edu/~crshalizi/notabene/info-geo.html
[watanabe]: http://books.google.com.au/books?id=5-70HAAACAAJ&dq=watanabe+statistical+learning+theory
[awari]: http://books.google.com.au/books/about/Methods_of_Information_Geometry.html?id=vc2FWSo7wLUC

[^1]: I'm going to ignore issues such as convergence, existence, etc. Just assume things are "well-behaved" where necessary.
