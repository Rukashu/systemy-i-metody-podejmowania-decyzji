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

scatterplot <- ggplot(data=df, aes(x = Price, y = Pojemnosc, col = Rank)) + geom_point()
scatterplot <- scatterplot + geom_point(size = 5) + xlab("Price")+ylab("Pojemnosc") + labs(colour = "Rank") + ggtitle("Srednia")
scatterplot <- scatterplot + scale_colour_brewer(palette = "Set1") + theme(plot.title = element_text(vjust =+ 2)) + scale_x_continuous(breaks = 1:8)
scatterplot
