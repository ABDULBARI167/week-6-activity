# week-6-activity

##SVM algorithm
###SVM (Support Vector Machine) classification techniques are used to examine labeled training data in supervised learning. SVM can utilize either a linear or non-linear model to classify characteristics in a training set into categories. The data set's kernel function, such as linear, nonlinear, polynomial, radial basis function (RBF), and sigmoid, determines the classifier's linearity. As a result, the kernel approach can be used to provide non-linear classification in SVM. 
In our script, the model tries to vividly show different representation like cluster charts, bar charts to clear show similarities and differences between the group members. In addition, the model clearly depicts SVM classification plot (petal.width against petal.length) whereby  group members are placed into clusters (setosa, versicolor and Virginia species)  which are easily distinguishable.
##SVM accuracy: 70%

##K Means algorithm
###The K Means method is an unsupervised non-linear algorithm that clusters data into groups based on similarities. It attempts to divide the data into a predetermined number of clusters. Each training example is assigned to a section termed a cluster after data segmentation. The unsupervised algorithm has a heavy dependence on raw data and spends a lot of time manually reviewing it for relevance. It's employed in a multitude of industries, including banking, healthcare, retail, media, and more.
In our algorithm, From the first two scatter plots, the data points are plotted randomly hence overlapping clusters. However, From the other scatter plots, the data is grouped in clusters hence the data points are clearly distinguishable.
##K Means accuracy: 35.33%

##C50algorithm
###In Data Mining, the C5. 0 algorithm is utilized as a Decision Tree Classifier, which can be used to make a decision based on a sample of data either univariate or multivariate predictors.
By reducing the estimated entropy value, this approach employs an information entropy computation to find the optimum rule for splitting the data at that node into purer classes. This means that as each node splits the data depending on the rule at that node, each subset of data split by the rule will finally include just one class. C50 runs quickly since this process is straightforward to compute.
The C50 algorithm is robust. It can deal with both numeric and categorical data [both types are shown in this example]. It can also cope with data values that are missing. A decision tree or a rule set can be produced by the R implementation. The output model can be used to [predict] a class for previously unclassified data.
In our script, this model uses a decision tree to vividly represent members of each node. Each path is taken when a condition is met.  For instance, node 2 falls where petal length is less or equal to 1.9 and node 3 where petal length is greater than 1.9. In addition, node 4 holds that petal length should be less than or equal to 4.9 while for node 5, petal length should be greater than 4.9
##C5.0 accuracy: 88.89%
