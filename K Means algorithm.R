#K-Means Clustering

require("datasets")
data("iris") # load Iris Dataset
str(iris) #view structure of dataset

summary(iris) #view statistical summary of dataset

head(iris, 3) #view top  rows of dataset

#Preprocess the dataset
#Since clustering is a type of Unsupervised Learning, 
#we would not require Class Label(output) during execution of our algorithm. 
#We will, therefore, remove Class Attribute â??Speciesâ? and store it in another variable. 
#We would then normalize the attributes between 0 and 1 using our own function.

iris.new<- iris[,c(1,2,3,4)]
iris.class<- iris[,"Species"]
head(iris.new, 3)

head(iris.class, 3)

normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)
head(iris.new)

#Apply the K-means clustering algorithm
result<- kmeans(iris.new,3) #aplly k-means algorithm with no. of centroids(k)=3
result$size # gives no. of records in each cluster

result$centers # gives value of cluster center datapoint value(3 centers for k=3)

result$cluster #gives cluster vector showing the custer where each record falls

#Verify results of clustering
par(mfrow=c(2,2), mar=c(5,4,2,2))
plot(iris.new[c(1,2)], col=result$cluster)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed in clusters
plot(iris.new[c(1,2)], col=iris.class)# Plot to see how Sepal.Length and Sepal.Width data points have been distributed originally as per "class" attribute in dataset
plot(iris.new[c(3,4)], col=result$cluster)# Plot to see how Petal.Length and Petal.Width data points have been distributed in clusters
plot(iris.new[c(3,4)], col=iris.class)

table(result$cluster,iris.class)

#Results of the table show that Cluster 1 corresponds to Virginica, 
#Cluster 2 corresponds to Versicolor 
#and Cluster 3 to Setosa.

#Total number of correctly classified instances are: 36 + 47 + 50= 133
#Total number of incorrectly classified instances are: 3 + 14= 17

#How did the model do?
#1.From the first two scatter plots, The data points are plotted randomly (hence overlapping clusters)
#2. From the other scatter plots,the data is grouped in clusters (hence the data points are clearly distinguishable).

iris.new<- iris[,c(1,2,3,4)]
pca <- princomp(iris[,c(1,2,3,4)], cor=T)
pc.comp <- pca$scores
pc.comp1 <- -1*pc.comp[,1]
pc.comp2 <- -1*pc.comp[,2]
pc_combined <- cbind(pc.comp1, pc.comp2)
iris<- as.data.frame(cbind(iris$class,pc_combined))
names(iris)[1] <- 'class'
iris$class <- as.factor(ifelse(iris$class==1,'AB','NO'))
fviz_nbclust(iris.new, kmeans, method = "wss")
kmean_model <- kmeans(iris.new, centers = 2, nstart = 25)
str(kmean_model)
fviz_cluster(kmean_model, data = iris.new)
kmean_model_cluster <- as.data.frame(kmean_model$cluster)
names(kmean_model_cluster)[1] <- 'class'
kmean_model_cluster$class <- as.factor(ifelse(kmean_model_cluster=='1','AB','NO'))
install.packages("caret")
library(caret)
trControl <- trainControl(method  = "cv",number  = 10)
n = nrow(iris)
index = sample(1:n, n*0.75, replace=FALSE)
train = iris[index,]
test = iris[-index,]
test_pca <- pc_combined[-index,]
fit <- train(class~.,
             method     = "knn",
             tuneGrid   = expand.grid(k = 2:50),
             trControl  = trControl,
             metric     = "Accuracy",
             data       = train)
fit
accuracy <- fit$results[,c(1:2)]
best_K <- fit$bestTune[1,1]
test_pred <- predict(fit, newdata = test)

test2 <- test
test2$P.class <- predict(fit, newdata = test2)
test3 <- cbind(test2,test_pca)
confusionMatrix (iris$class, kmean_model_cluster$class)

#accuracy rate: 
o.3533 = 35.33%
  
