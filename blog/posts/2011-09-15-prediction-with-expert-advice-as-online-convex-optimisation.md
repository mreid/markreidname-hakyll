---
title: Prediction with Expert Advice as Online Convex Optimisation
excerpt: A short note describing the Prediction With Expert Advice game and why it is a special case of Online Convex Optimisation.
location: Canberra, Australia
---

I have been working with [Bob Williamson][] and [Tim Van Erven][] recently to [better understand][colt11] the notion of _mixability_ in what is known as the Prediction With Expert Advice (PWEA) setting for online learning. I was curious as to how this setting [relates][rml] to another one that is commonly studied in learning theory: [online convex optimisation][oco] (OCO). 

It is already known that PWEA is a special case of OCO (see, for example, Peter Bartlett's [summer school course][B10] or Kalai and Vempala's [JCSS paper][KV04]) but I wanted to work out the correspondence explicitly for myself. Since there is one of those obvious-in-hindsight tricks involved I thought it would be worth writing up and sharing it.

[bob williamson]: http://users.cecs.anu.edu.au/%7Ewilliams/
[tim van erven]: http://www.timvanerven.nl/
[rml]: http://rml.cecs.anu.edu.au/
[oco]: http://webdocs.cs.ualberta.ca/~maz/publications/ICML03.pdf
[B10]: http://www.stat.berkeley.edu/~bartlett/talks/BeijingCourse2010.html
[KV04]: http://people.cs.uchicago.edu/~kalai/papers/onlineopt/onlineopt.pdf

## Introduction

[Prediction With Expert Advice][PWEA] is typically posed as a game where in each round a learner receives advice in the form of predictions from a set of experts about a future outcome and then merges these expert opinions to form its own prediction. The outcome is then revealed and the learner and all of the experts receive a penalty depending on how well their prediction fits with the revealed outcome. This penalty is determined by a fixed loss function that is known to the learner. The aim of the learner in this game is to incur an aggregate penalty over many rounds that is not much worse than the best expert.

[PWEA]: http://onlineprediction.net/?n=Main.PredictionWithExpertAdvice

You can easily imagine playing such a game yourself: each day you check a dozen different weather forecasts then make up your own mind about the chance of rain tomorrow, e.g., you predict a 75% chance of rain. The next day it will either rain or not and imagine that you and the experts lose points depending on how bad your predictions were: predicting a 75% chance when it is sunny loses you more points than if you predicted a 20% chance of rain. The function that determines exactly how many points you lose for predicting p% chance of rain when the outcome is sunny is called the _loss function_.

Mixability is a property of a loss function that characterises when learning can occur efficiently in a PWEA game. That is, when it is possible to make the difference between the learner and the best expert—the _regret_—decrease rapidly (specifically like $1/T$ after $T$ rounds). 

In our [recent COLT paper][colt11] we were able to characterise mixability in terms of the curvature of the loss for a natural class of losses known as _[proper losses][]_. These losses are "sensible" in that if the true probability of an outcome is $p$ then the expected loss is minimised by predicting $p$. This seemingly innocent requirement actually gives rise to a lot of geometric structure that has been well studied in the economics literature, and that we exploit in our paper.

[colt11]: /bits/pubs/colt11.pdf
[proper losses]: /blog/proper-losses.html

Online Convex Optimisation is a similar type of game to PWEA in that both are [competitive online prediction][cop] games: a learner repeatedly makes predictions and receives a penalty based on that prediction and its performance is compared to a class of simple alternatives. The main differences between PWEA and OCO are that: the learner does not have access to expert predictions and their penalties; the regret of the learner is relative to a possibly uncountable set of alternatives; and the loss functions involved are assumed to be convex.

[cop]: http://onlineprediction.net/?n=Main.CompetitiveOn-linePrediction

Despite these differences, it is possible to present Prediction With Expert Advice as a very special case of Online Convex Optimisation. After formalising the two games, I'll present the "trick" for turning the former into the latter.

## Prediction with Expert Advice

In the general Prediction with Expert Advice (PWEA) game a learner competes against $K$ experts in a game consisting of $T$ rounds. Each round, the each expert reveals a prediction from $\Delta^N$, the set of probabilities over $N$ outcomes. The learner observes and combines these to form its own prediction from $\Delta^N$. The world then reveals one of $N$ outcomes $y \in [N] = 1, \ldots, N$ and the experts' and learner's predictions are assessed via a loss function $\ell : \Delta^N \to R^n$ so that a prediction $p$ incurs a penalty $\ell_y(p)$ when outcome $y$ occurs. 

Expressed in a kind of pseudo-code, the game is:

> For $t = 1, …, T$:
>
>  1. Experts make predictions $p^{1,t}, … p^{K,t} \in \Delta^N$
>  2. Learner predicts $p^t$ based on expert predictions
>  3. World reveals outcome $y^t \in \{ 1, … n \}$
>  4. Experts incur penalties $\ell_{y^t}(p^{k,t})$ and the learner incurs $\ell_{y^t}(p^t)$ 

The aim of the learner in this game is to minimise its total loss $L^T = \sum_t \ell_{y^t}(p^t)$ relative to the smallest expert loss $\min_k L^T(k) = \min_k \sum_t \ell_{y^t}(p^{k,t})$. The difference $L^T - \min_k L^T(k)$ is called the _regret_.


## Online Convex Optimisation

Online Convex Optimisation (OCO) is similar in that a sequential game is played over $T$ rounds where a learner makes prediction from some convex set $X \subset R^d$. However, as mentioned above, the OCO game is simpler in that there are no (explicit) experts and more general in that the finite number of outcomes that the world can reveal is replaced by an arbitrary set of convex functions $F$. The function $f\in F$ chosen by the world and used to assign a penalty $f(x)$ to the learner. 

Expressed in pseudo-code, OCO is the following game:

> For $t = 1, …, T$:
>
>  1. Learner predicts $x^t \in X \subset R^d$
>  2. World reveals a convex function $f^t \in F$
>  3. Learner incurs penalty $f^t(x^t)$ 

The learner's aim here is to minimise the regret relative to the best single prediction $x \in X$ in hindsight. That is, the learner wants to minimise the difference between $L^T = \sum_t f^t(x^t)$ and $\min_x L^T(x) = \min_x \sum_t f^t(x)$. Once again, the difference $L^T - \min_x L^T(x)$ is called the _regret_.

## PWEA is a special case of OCO

We can show that PWEA is a special case of OCO by defining an OCO game that mimics the PWEA game. 

The main trick is to define the set of functions $F$ for OCO so that step 1 in the PWEA game (where the experts reveal their predictions) can be simulated. Specifically, if for each $t\in[T]$ in the PWEA game expert $k$ makes prediction $p^{k,t}$ and the outcome is $y^t$, we define a OCO game via a sequence of linear (and thus convex) functions $f^t$. These are defined so that $f^t(e^k) = \ell_{y^t}(p^{k,t})$ where $e^k$ the vertices of $\Delta^K$ and are linearly extended to all _mixtures_ of $K$ experts, denoted $x \in X = \Delta^K$, by defining $f^t(x) = \sum_k x_k f^t(e^k)$. 


This construction means that the learner in the OCO game can always mimic the performance of a single, fixed expert $k$ in the PWEA game by constantly playing $e^k$. In some sense, this is how step 1 of the PWEA game is recovered in the OCO game.

Now consider what happens when we minimise the total loss for this OCO game. This involves finding a mixture $x \in \Delta^K$ such that $L^T(x) = \sum_t f^t(x)$ is minimised. Since $f^t(x) = \sum_k x_k \ell_{y^t}(p^{k,t})$ we see that $L^T(x) = \sum_k x_k \sum_t \ell_{y^t}(p^{k,t}) = \sum_k x_k L^T(k)$ where $L^T(k)$ is the total loss for expert $k$ in the PWEA game. This weighted sum is clearly minimised by choosing the mixture $x \in \Delta^K$ that puts all its mass on the single expert $k$ corresponding to the smallest $L^T(k)$ term. Furthermore, for that choice of $x = e^k$ we have $L^T(x) = L^T(k)$ and so $\min_x L^T(x) = \min_k L^T(k)$.

The above argument shows that any PWEA game can be presented as an OCO game and that the best single expert in the PWEA game corresponds to the best single prediction in the corresponding OCO game.

## Regret Bounds

Since the minimal total loss in the PWEA and OCO games are equivalent, we can look at the regrets for both games by just considering the total loss for each. If a learner playing the OCO game predicts $x^t$ at round $t$ the loss it incurs is $f^t(x^t) = \sum_k x_k^t \ell_{y^t}(p^{k,t})$. If all of the partial losses $\ell_y$ are _convex_ then we see that predicting $p^t = \sum_k x_k^t p^{x,t}$ in the PWEA game will incur a penalty $\ell_{y^t}(p^t) \le f^t(x^t)$ in that round. 

Therefore, any regret bound that holds for OCO will also hold for an OCO-simulated PWEA game with convex losses since the OCO regret dominates the PWEA regret achieved by just playing convex combinations of the expert predictions. For a recent summary of lower and upper bounds for various types of online optimisation games, I point the reader to the [COLT 2008 paper][ABRT08] by [Jake Abernethy][] and co-authors.

[ABRT08]: http://colt2008.cs.helsinki.fi/papers/111-Abernethy.pdf
[Jake Abernethy]: http://www.cs.berkeley.edu/~jake/

What happens if the PWEA losses $\ell_y$ are not convex? The same reduction argument can be run only if for every mixture $x \in \Delta^K$ there exists prediction $p(x) \in \Delta^N$ such that for all outcomes $y$ we have $\ell_y(p(x)) \le \sum_k x_k \ell_y(p(x))$. This is similar condition required of the [substitution function][] needed in the [Weak Aggregating Algorithm][] so I suspect this condition is related to mixability but will leave the details for another time.

[substitution function]: http://onlineprediction.net/?n=Main.SubstitutionFunction
[weak aggregating algorithm]: http://onlineprediction.net/?n=Main.WeakAggregatingAlgorithm