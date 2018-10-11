### Assignment 4

#### Introduction

This assignment is based on the example **The spam filter**. The objectives are: (a) to try some variations of the filters developed in class, and (b) to explore a simple approach to the **validation** of a predictive model.

The objective of the validation is to dismiss **overfitting**. Broadly speaking, it consists in checking that the model being validated works as expected on data which have not been used to develop it. In the simplest approach to validation, we develop the model in a **training set**, trying it on a **test set**. The training and test sets can be predefined (e.g. training with first ten months of the year and testing with the last two months) or can be obtained from a **random split** of a unique data set.

#### Tasks

1. Develop a spam filter based on a logistic regression equation and compare your model with the model presented in the example.

2. Validate the models obtained for this example using a 50-50 split. In R, a random selection of one half of the rows of a data set `df` with `N` rows can be done with
`train = sample(1:N, size=N/2, replace=FALSE)`.
Then, the training set would be `df[train, ]` and the test set `df[-train, ]`.

3. Drop the three `cap_` variables and binarize all the `word_` variables, transforming them into dummies for the occurrence of the corresponding word. Develop a spam filter using this binarized data set and compare your results with those presented in the example.

#### Submission

Submit either a .R document with your code and short comments, or a full report in HTML, PDF or Word format, integrating the code, the R output and your comments.

#### Deadline

October 16 (Tuesday), 24:00.
