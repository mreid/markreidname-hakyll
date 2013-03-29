---
title: What is Fano's Inequality?
excerpt: A look at an information theoretic inequality that is useful for establishing lower bounds for minimax risks.
location: Canberra, Australia
---

I'm something of a newcomer to information theory. I understand the basics—entropy, coding, KL divergence—but have not yet spent enough time with the key results in the area to feel like they are old friends. Since I keep encountering them in my own research I decided it was time to introduce myself and hang out with them a bit.

One motivation is that I was recently reading _[Information-theoretic lower bounds on the oracle complexity of convex optimization](http://arxiv.org/abs/1009.0571)_ by [Alekh](http://www.eecs.berkeley.edu/~alekh/) and others and was intrigued by their use of Fano's inequality to establish lower bounds for convex optimisation problems.

## Lower bounds for convex optimisation
Suppose an optimising algorithm is trying to find an input that minimises some unknown convex function drawn from some known class of functions. It is allowed to repeatedly request information about the value of the function and its derivatives from an oracle. An important question about this problem is: given some class of functions and some fixed budget of oracle queries, how close can the _best_ optimisation technique get to minimising the _hardest_ problem from that class? 

As shown in the paper, if an optimiser is allow to make only T requests of the oracle then it cannot get within $\Omega(T^{-1/2})$ of the minimum in the worst case. The analysis is a lot more refined than my fairly clumsy rephrasing of the result but I hope it gives the general idea.

What is interesting about this type of result is how strong a statement it is. For _any_ optimisation algorithm you can dream up there are situations where you are not going to get to the minimum any faster than this. The nice insight of setting up the problem with an oracle is that we can quantify and reason about the minimum amount of _information_ that is require to pass between the oracle and any optimiser rather than the algorithmic details of the optimisers themselves. 
To do this the problem of optimising a function is reduced to identifying one from some finite but "hard" set of functions. Identifying things based on random input is then an information theoretic problem and allows for the application of Fano's inequality. Apparently this is a fairly common trick for establishing lower bounds for minimax risk.

I won't discuss the convex optimisation result any further and instead focus on explaining Fano's inequality and why it is such an interesting result.

## Fano's Inequality
[Fano's inequality][] is a result from information theory that relates the conditional entropy of a random variable $X$ relative to the correlated variable $Y$ to the probability of incorrectly estimating $X$ from $Y$. The intuition here is that the probability of making a mistake when estimating $X$ using the value of $Y$ is going to depend on how certain we are about the value of $X$ given $Y$. 

[Fano's inequality]: http://www.scholarpedia.org/article/Fano_inequality

Let's introduce some notation so we can state the result more formally. I'll more or less use the presentation from §2.10 of Cover and Thomas's _[Elements of Information Theory](http://www.elementsofinformationtheory.com/)_. Suppose $\hat{X}$ is an estimator for a random variable $X$ and they are conditionally independent given $Y$.  An example of this situation is when some function of $Y$ is used to predict $X$—that is, $\hat{X}=f(Y)$. 

We assume the random variable $X$ and its estimator $\hat{X}$ can take on up to $k$ different values[^1]. We are interested in when $X$ and $\hat{X}$ are not equal—that is, when we've incorrectly predicted $X$. Let $E$ denote the event $X \ne \hat{X}$ and let $p$ be its probability. Then, Fano's inequality tells us that

$$ H(E) + p\log k \ge H(X|Y) $$

where $H(X|Y)$ is the conditional entropy of $X$ given $Y$. This in turn implies a weaker result, namely

$$ p \ge \frac{H(X|Y) - 1}{\log k} $$

since the entropy of the binary event $E$ is at most 1.

I won't go into the proof here even though it is a relatively straight-forward application of the chain rule for entropy to expand the conditional entropy of the misclassification event and $X$ given $\hat{X}$. 

## Implications
The second, weaker form of the result clearly shows how the probability of incorrectly predicting the value of $X$ based on information from $Y$ is constrained by the remaining uncertainty $H(X|Y)$ about $X$ when $Y$ is known. 

An extreme situation is when $X$ and $Y$ are independent in which case $H(X|Y) = H(X)$ and the probability of misclassification depends on how uncertain the value of $X$. When it takes on any of its $k$ values uniformly we see that $p \ge 1 - \frac{1}{\log k} $. Unsurprisingly, this says the probability of making an error heads to one as $X$ can take on more and more possible values.

The first, tighter form of the inequality gives a converse to this extreme case. We see that when $p = 0$—that is, when we can perfectly predict $X$ based on $Y$—the conditional entropy $H(X|Y)$ is necessarily 0—that is, $X$ must be perfectly known given $Y$. 

## Abstraction
One aspect of Fano's inequality that is shared with many results in information theory is that the details of exactly _how_ $X$, $Y$ and $\hat{X}$ are related are abstracted into their joint probability distribution. The choice of function $f$ that might define the estimator $\hat{X} = f(Y)$ is only conceived of via the joint distribution it induces. 

It is this level of abstraction away from functions or algorithms that make information theoretic results such handy tools for establishing results like the lower bounds for convex optimisation. 

[^1]: The number of values the estimator $\hat{X}$ can take can be larger than the number of values for $X$. When they are the same a slightly tighter bound is possible.


