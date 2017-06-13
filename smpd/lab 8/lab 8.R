library("rpart")
library("dplyr")
library("party")
data <- as.data.frame(matrix(c(7.9, 7.9, 7.9, 9.7, 7.9, 12.9, 12.9, 9.7, 12.9, 7.9,
                 32, 32, 128, 32, 128, 128, 128, 256, 256, 16,
                 2, 2, 2, 2, 2, 4, 4, 2, 4, 2,
                 2499, 2399, 2899, 3599, 2999, 4949, 5199, 4599, 5699, 1869), 10, 4))
labels <- c("1", "2", "3", "4", "5")
result <- c(2, 4, 3, 2, 3, 4, 3, 4, 3, 4)
factors <- factor(result, labels)
data <- cbind(data, factors)
colnames(data) <- c("Wyswietlacz", "Pojemnosc", "RAM", "Price", "Rank")
mydata <- c("training", "test") %>% sample(nrow(data), replace=T) %>% split(data, .)
rtree_fit <- rpart(Rank ~ ., mydata$training, control = rpart.control(minsplit=1, minbucket=1, cp=0.001))
par(mar = rep(0.2, 4))
plot(rtree_fit, uniform = TRUE)
text(rtree_fit, use.n = TRUE)
