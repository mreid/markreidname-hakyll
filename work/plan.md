---
layout: name
title: Plan
section: Work
---

Research Agenda
===============

My research is predicated on understanding the many and varied types of machine learning tasks, their constituent parts, and the relationships between the parts and between tasks.

My work on "Mapping Machine Learning" aims to clearly define tasks so as to understand how they relate to each other.

My work on "Representations of losses" examines and relates the parts of a single learning task and provides various perspectives on them.

The "Protocols and Structures for Inference" aims to operationalise the map.

The "Transfer Learning" part aims to exploit insights from the map to put the notion of task similarity on a firmer footing and explore implications for sharing biases between tasks.

## Mapping Machine Learning
This work aims to underpin and draw together my other research by providing a precise, consistent, and flexible language for describing and relating learning tasks.

### Regret Bounds and Reductions
A key compenent in learning tasks is the loss function used to define the learner's objective. Solving a classification task by minimising 0-1 loss is know to be NP-hard (citation) so solving a related task with a different, possibly convex, loss is computationally simpler.

My work on regret bounds and convex losses examines the relationships between tasks when a surrogate loss is used. In "Surrogate Regret Bounds for Proper Losses" (ICML 2009) we gave a simple derivation of already known regret bounds that establish the consistency of minimising surrogate losses for classification.

The tools developed in this analysis also shows how the Probing reduction of Langford et al. (citation) is a special case of integral representations of losses via Taylor's theorem.

## Representations of loss, risk, entropy, and divergence
In "Information, Divergence and Risk for Binary Experiments" we relate the risk minimisation to f-divergence estimation, as well as statistical and Bregman divergences. This provides several perspectives on the key compenents of a learning task: the data distribution and loss.

We also revisting and generalise some existing work on Choquet representations of losses which provide a natural reduction between probability estimation tasks and families of cost-weighted classification tasks.

### Comparison of divergences
In "Generalised Pinsker Inequalities" (COLT 2009) we consider the relationship between f-divergences and variational divergence and give provably tight bounds that generalise the classical (but loose) Pinsker inequality relating KL divergece and variational divergence.

## Protocols and Structures for Inference
This ARC funded linkage project with Canon Research Australia (CISRA) aims to extend and operationalise the Mapping Machine Learning work by creating an architecture for defining machine learning web services. This project aims to open and substantially generalise the recent (and independently proposes) Google Prediction API.

### Compositional Inference and Meta-Algorithms
With an architecture in place for allowing predictors to be curated and interact, it becomes important to understand how learnt predictors can be combined to solve larger and more complex tasks (e.g., combining a topic predictor for text documents and an image recogniser to classify web pages with text and images).

Services can also be built that allow for the combination of learning algorithms (e.g., boosting, hedge, etc).

## Transfer Learning
Once tasks can be described precisely, it becomes possible to systematically explore the notion of task similarity. Task similarity is a necessary foundation for transfer learning---theory and methods for using information from support tasks to improve predictive performance on a set of target tasks---and multitask learning---improving the average performance on a set of tasks by exploiting their similarity.

In this research I intend to systematically survey existing approaches to transfer and multitask learning by articulating the implicit notion of task similarity they exploit. By understanding the parts of tasks (instance spaces, losses, data distributions, hypothesis space distributions, constraints) we can analyse transfer in cases where one or more of these are different across tasks.


