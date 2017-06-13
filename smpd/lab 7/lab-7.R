library("C50")
data <- matrix(c(7.9, 7.9, 7.9, 9.7, 7.9, 12.9, 12.9, 9.7, 12.9, 7.9,
                 32, 32, 128, 32, 128, 128, 128, 256, 256, 16,
                 2, 2, 2, 2, 2, 4, 4, 2, 4, 2,
                 2499, 2399, 2899, 3599, 2999, 4949, 5199, 4599, 5699, 1869), 10, 4)
labels <- c("1", "2", "3", "4", "5")
result <- c(2, 4, 3, 2, 3, 4, 3, 4, 3, 4)
test <- factor(result, labels)
colnames(data) <- c("Wyswietlacz", "Pojemnosc", "RAM", "Price")
treeModel <- C5.0(x = data[,], y = test)
treeModel
summary(treeModel)
plot(treeModel)

