epsilon <-0.01
# the performance table
performanceTable <- rbind(
  c(7.9 , 32 , 2 , 2499),
  c(7.9 , 32 , 2 , 2399),
  c(7.9 , 128 , 2 , 2899),
  c(9.7 , 32 , 2 , 3599),
  c(7.9 , 128 , 2 , 2999),
  c(12.9 , 128 , 4 , 4949),
  c(12.9 , 128 , 4 , 5199),
  c(9.7 , 256 , 2 , 4599),
  c(12.9 , 256 , 4 , 5699),
  c(7.9 , 16 , 2 , 1869)
)
rownames(performanceTable) <- c(
  "Apple iPad mini 4 Wi-Fi + Cellular 32GB (szary)",
  "Apple iPad mini 4 Wi-Fi + Cellular 32GB (srebrny)",
  "Apple iPad mini 4 Wi-Fi + Cellular 128GB (srebrny)",
  "Apple iPad Pro 9,7 Wi-Fi + Cellular 32GB (zloty)",
  "Apple iPad mini 4 Wi-Fi + Cellular 128GB (zloty)",
  "Apple iPad Pro 12,9 Wi-Fi + Cellular 128GB (zloty)",
  "Apple iPad Pro 12,9 Wi-Fi + Cellular 128GB (szary)",
  "Apple iPad Pro 9,7 Wi-Fi + Cellular 256GB (zloty)",
  "Apple iPad Pro 12,9 Wi-Fi + Cellular 256GB (srebrny)",
  "Apple iPad mini 4 Wi-Fi + Cellular 16GB (zloty)")

colnames(performanceTable) <- c(
  "Wyœwietlacz",
  "Pojemnoœæ ",
  "Pamiêæ RAM",
  " Cena ")
# ranks of the alternatives
alternativesRanks <- c(1,2,3,4,5,6,7,8,9,10)
names(alternativesRanks) <- row.names(performanceTable)
# criteria to minimize or maximize
criteriaMinMax <- c("max" , "max" , "max" , "min")
names(criteriaMinMax) <- colnames(performanceTable)
x<-additiveValueFunctionElicitation(performanceTable,
                                    criteriaMinMax, epsilon,
                                    alternativesRanks = alternativesRanks)
print(x)