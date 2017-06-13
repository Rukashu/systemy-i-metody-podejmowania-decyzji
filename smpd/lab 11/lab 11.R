library("sets")

sets_options("universe", seq(1, 1200, 0.5))
variables <- set(
  Wyswietlacz = fuzzy_partition(varnames = c(small = 1, medium = 7.9, large = 12.9), sd = 1.0),
  Pojemnosc = fuzzy_partition(varnames = c(small = 1, medium = 32, large = 256), sd = 1.0),
  RAM = fuzzy_partition(varnames = c(small = 0, medium = 2, large = 4), sd = 2.0),
  Price = fuzzy_partition(varnames = c(low = 0, medium = 2500, high = 6000), sd = 500),
  Rank = fuzzy_partition(varnames = c(poor = 1, mediocre = 2, alright = 3, nice = 4, great = 5), FUN = fuzzy_cone, radius = 0.5)
)

# Fuzzy rules
rules <- set(
  fuzzy_rule(Wyswietlacz %is% small && Pojemnosc %is% small && RAM %is% small, Rank %is% poor),
  fuzzy_rule(Wyswietlacz %is% small && Pojemnosc %is% small, Rank %is% mediocre),
  fuzzy_rule(Wyswietlacz %is% medium && Pojemnosc %is% medium, Rank %is% nice),
  fuzzy_rule(Wyswietlacz %is% large && Pojemnosc %is% large, Rank %is% great),
  fuzzy_rule(Price %is% low && Wyswietlacz %is% small && Pojemnosc %is% small, Rank %is% alright),
  fuzzy_rule(Price %is% medium && Wyswietlacz %is% medium && Pojemnosc %is% medium, Rank %is% nice),
  fuzzy_rule(Price %is% large && Wyswietlacz %is% large && Pojemnosc %is% large, Rank %is% great),
  fuzzy_rule(Price %is% high && RAM %is% large, Rank %is% alright),
  fuzzy_rule(Price %is% low && RAM %is% small, Rank %is% alright),
  fuzzy_rule(Price %is% low && RAM %is% large, Rank %is% great),
  fuzzy_rule(Price %is% high && RAM %is% small, Rank %is% poor)
)
model <- fuzzy_system(variables, rules)

print(model)
plot(model)
example.1 <- fuzzy_inference(model, list(Wyswietlacz = 7.9, Pojemnosc = 16, RAM = 2, Price = 1199))
gset_defuzzify(example.1, "centroid")
dev.new()
plot(example.1)
