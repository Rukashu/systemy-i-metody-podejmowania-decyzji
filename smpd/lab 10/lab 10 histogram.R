library("ggplot2")

df <- as.data.frame(matrix(c(7.9, 7.9, 7.9, 9.7, 7.9, 12.9, 12.9, 9.7, 12.9, 7.9,
                             32, 32, 128, 32, 128, 128, 128, 256, 256, 16,
                             2, 2, 2, 2, 2, 4, 4, 2, 4, 2,
                             2499, 2399, 2899, 3599, 2999, 4949, 5199, 4599, 5699, 1869), 10, 4))
labels <- c("1", "2", "3", "4", "5")
result <- c(2, 4, 3, 2, 3, 4, 3, 4, 3, 4)
factors <- factor(result, labels)
df <- cbind(df, factors)
colnames(df) <- c("Wyswietlacz", "Pojemnosc", "RAM", "Price", "Rank")

histogram <- ggplot(df, aes(Pojemnosc))

histogram <- histogram + geom_histogram(binwidth=6, color="#000000", fill="#FFF20A")
histogram <- histogram + labs(x="Pojemnosc", y="Amount") + ggtitle("Liczba danych")
histogram

histogram.facets <- histogram+facet_grid(Rank~.)+ggtitle("Liczba danych")
histogram.facets #vertically
