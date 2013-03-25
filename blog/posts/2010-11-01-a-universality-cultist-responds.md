---
title: A Universality Cultist Responds
excerpt: An attempt to set the record straight about the role of generalisation bounds in polite society.
location: Canberra, Australia
---

I recently discovered a very good machine learning blog called [Innou][] by Harsha Veeramachaneni. In particular, the provocative title of his latest post—[The Cult of Universality in Statistical Learning Theory][post]—was what caught my eye. As a recent [convert and evangelist][work] of the besieged cult, I felt compelled to clear up some all too common misunderstandings and misconceptions that hound our noble organisation.

Before I start, I just want to make it clear that while I dislike some of Harsha's arguments I don't disagree with all of his conclusions: there _is_ an unfortunate disconnect between the theory and practice of machine learning; generalisation bounds found in the literature _are_ often too focused on the worst-case; and his call for "medicine bottle rules" for analyses has some merit. 

[innou]: http://mlstat.wordpress.com/ 
[post]: http://mlstat.wordpress.com/2010/10/31/the-cult-of-universality-in-statistical-learning-theory/ 
[work]: http://mark.reid.name/work/pubs/

## What Do Generalisation Bounds Actually Say?
As Harsha rightly points out, generalisation bounds appear all over the machine learning literature. To the uninitiated they appear [cryptic, opaque, and unnecessary][math]. To make matters worse, there is something [cargo cultish][] about their use in many papers. "If I say exactly the right incantation of $\epsilon$s, $\delta$s, VCs, and inequality signs", our hopeful author thinks, "the High Priests of Reviewing will be appeased and not sacrifice my first-born paper." Mind you, it seems theorists do [something similar with experimental results][sectiond] too. 

But I digress...

[cargo cultish]: http://en.wikipedia.org/wiki/Cargo_cult
[sectiond]: http://www.inherentuncertainty.org/2010/08/section-d.html
[math]: http://mark.reid.name/iem/clarity-and-mathematics.html

Let's have a look at a typical _uniform convergence bound_ for generalisation errors: 
> Let $L$ be a learning algorithm that, when given a training sample $S$, returns a classifier from the hypothesis space $H$, and let $D$ be any joint distribution over instances and labels. Then, with high probability over samples $S$ from the product distribution $D^m$, the expected error of the classifier $h = L(S) \in H$ is at most the training error of $h$ on evaluated on the sample $S$ plus some function of $m$ and the complexity of $H$.

Now this is certainly more long-winded than the way Harsha put it but I want to make a few things more explicit and prefer to make a clear distinction between a learning algorithm (or "learner") and the classifiers (or, more generally, "predictors") they produce. A learner learns a classifier that classifies[^1].

[^1]: I often wonder how much [Weka][]'s API is to blame for this. Programs using [weka.classifiers.Classifier][classifier] must call `buildClassifier()` and `classifyInstance()` on the same object, confusing the notion of a learning algorithm (e.g., the decision tree learner [Id3][]) and the thing learnt (a decision tree classifier).

[weka]: http://www.cs.waikato.ac.nz/ml/weka/
[classifier]: http://weka.sourceforge.net/doc/weka/classifiers/Classifier.html
[Id3]: http://weka.sourceforge.net/doc/weka/classifiers/trees/Id3.html

I also explicitly talk about the product distribution $D^m$ from which i.i.d. samples are drawn. The "high probability" clause is with respect to this product distribution, not the example distribution $D$. Finally, the complexity is a function of the entire set $H$, not any particular classifier $h$ that the learner might return.

These are known as uniform convergence bounds because they show how much the empirical error can deviate from its corresponding true error for all classifiers in $H$ simultaneously.

## The Hybrid SVM+NN Example
The main criticism Harsha has against the type of generalisation bounds described above is that they are quantified over _all possible_ data generating distributions $D$. To show why this "universality" is a problem Harsha constructs a hypothetical learning algorithm that is a hybrid SVM and nearest neighbour learner which I'll call SVM+NN.

As he describes it, the learner first tries to fit a good linear classifier to a training set using an SVM and then effectively "memorises" the correct label for all of the training examples misclassified by that linear classifier. An extra parameter $\epsilon$ is introduced that determines how close a test instance must be to a memorised training example to take on the training example's label. If a test instance is not within $\epsilon$ of a memorised instance the linear classifier is used to label it.

He then makes the following argument. By making $\epsilon$ very small the contribution to predictions made by the memorised points is negligible and so the generalisation error for the SVM and the SVM+NN classifier should be almost identical. However, the training error for SVM+NN is going to be zero and its complexity very large so the generalisation bound for SVM+NN is vacuous. Since it is the requirement that the bound hold over all distributions that makes the bound vacuous the desire for universal bounds like these is misguided.

As I said earlier, I don't necessarily disagree with Harsha's conclusion, however the example he uses to make this argument is somewhat misleading. Uniform convergence bounds specifically address how well the empirical error of a classifier estimates true error. The SVM+NN algorithm does not have a meaningful training error—it is zero for all training sets by construction. 

To put it another way, it is not universality that leads to a vacuous generalisation bound for SVM+NN, it is the fact that SVM+NN does not have an empirical error that depends on the training examples. 

Borrowing Harsha's analogy and stretching it even further: SVM+NN is a bicycle that is purposely built to be extremely bad at holding up pants.


## Escaping the Cult
So although I don't buy the particulars of Harsha's argument against uniform convergence bounds, I do agree that there is room in learning theory for generalisation bounds that take into account what might be known _a priori_ about the data generating distributions. In fact, I can confidently say we are not alone in wanting refined bounds as there is already a number of good results along these lines.

The first that springs to mind are bounds under what is now called the "[Tsybakov][] noise condition". This pertains to distributions for binary classification in which the positive and negative data distributions do not overlap too much. This type of distribution is particularly suited to linear classifiers and it was shown that for these algorithms faster rates of convergence can be obtained when the noise condition holds. See Mammen and Tsybakov's _[Smooth discrimination analysis][mammen]_ and Steinwart's _[When do Support Vector Machines learn fast?][ingo]_ for more details.

[tsybakov]: http://www.proba.jussieu.fr/~tsybakov/tsybakov.html
[mammen]: http://dx.doi.org/10.1214/aos/1017939240
[ingo]: http://www.ccs3.lanl.gov/~ingo/publications/mtns-04.ps

Another type of bound that provides a refined analysis can be found in the "luckiness" framework, first introduced by John Shawe-Taylor in 1998 and later built upon in Herbrich and Williamson's _[Algorithmic Luckiness][ralf]_. While these bounds are universal in that they apply to any choice of data distributions, they are data dependent and algorithm specific and can lead to tighter bounds for paricular assumptions about the data and algorithm.

[ralf]: http://jmlr.csail.mit.edu/papers/v3/herbrich02a.html

If you just want bounds that depend on the complexity of a classifier rather than the complexity of the learner's hypothesis space, [PAC-Bayesian bounds][pacbayes] provide a tight family of bounds of this type. Once again, these are still universal in the sense of holding for all data distributions but are less worst-case in that the bounds vary depending on which classifier the learner returns.

[pacbayes]: http://mark.reid.name/iem/a-compression-lemma.html

## Reading the Fine Print
One thing I did like in Harsha's discussion was the idea of "medicine bottle rules": a small set of instructions that should be followed when analysing learning algorithms. There purpose is to give some guidance about what the analysis is for, how to administer it, when not to use them, and warn about any strange side effects. 

In the case of uniform convergence bounds there should have been a label that stated: 
> These bounds are for the analysis of algorithms that have a meaningful empirical risk. Not to be used for the treatment of non-ERM algorithms. Inappropriate application may result in headaches, irritability, and vacuousness. 

Please consult your doctor if pain persists.

