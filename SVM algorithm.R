#e1071 will be used for Support Vector Classification.
install.packages("e1071")
install.packages("GGally")
install.packages("ggplot2")

library(e1071)
library(GGally)
library(ggplot2)

#get the dataset
data(iris)

#explore the data
str(iris)
head(iris,3)

#Create the SVM model
svm_model<-svm(Species ~., data=iris,kernel="radial")#linear/polynomial/sigmoid
print(svm_model)
summary(svm_model)
#Lets have a closer look at the parameters 
#and judge before hand if a good model can be created or not.
ggpairs(iris, ggplot2::aes(colour = Species, alpha = 0.4))
#We can clearly see from the Histograms of Petal.length 
#and Petal.width that we can clearly separate out Setosa species with very high confidence.

#However, Versicolor and Virginica Species are overlapped. 
#If we look at the scatter plot of Sepal.Length vs Petal.Length 
#and Petal.Width vs Petal.Length, 
#we can distinctively see a separator that can be draw between the groups of Species.

#Looks like we can just use Petal.Width and Petal.Length as parameters 
#and come with a good model. SVM seems to be a very good model for this type of data.

plot(svm_model, data=iris,
     Petal.Width~Petal.Length,
     slice = list(Sepal.Width=3, Sepal.Length=4) 
)

#from the graph you can see data, support vector(represented by cross sign) 
#and decision boundary, belong to 3 types of species

#White color represented predicted class for second species(versicolor)

#Pink color represented predicted class for third species(virginica)

#Also we have 52 Support vector, 
#8 of them belongs to first species
#(You can see 8 cross in first class), 
#22 of them belongs to second species, 
#21 of them belongs to third species.

#Predict each Species
#Confusion matrix and misclassification error
index<-1:nrow(iris)
testindex<-sample(index,trunc(length(index)/3))
testset<-iris[testindex,]
trainset<-iris[-testindex,]
names(iris)
pred = predict(svm_model,iris)
tab = table(pred= predict, true = testset[Species])
tab
tuned <- tune.svm(Species~., data = trainset, alpha = 0.4, cost = 10^(1:2))
summary(tuned)
#Get missclassification rate

1-sum(diag(tab)/sum(tab))

#How did the model do?
#The model clearly depicts SVM classification plot(petal.width against petal.length) whereby  group members are placed into clusters(setosa, versicolor and virginia)
#which are easily distinguishable.
#by using the tune()function to check for accuracy
#What is the accuracy rate?
 0.07 =70%

