library("arules")
library("arulesViz")

data("Groceries")

itemFrequencyPlot(Groceries, topN=20, type="absolute")

association.rules <- apriori(Groceries, parameter = list(supp=0.001, conf=0.9, maxlen=10))

inspect(association.rules)

inspect(head(sort(association.rules, by=c("conf", "supp"))))

shorter.association.rules <- apriori(Groceries, parameter = list(supp=0.001, conf=0.8, maxlen=3))

inspect(shorter.association.rules)

milk.association.rules <- apriori(Groceries, parameter = list(supp=0.001, conf=0.9), appearance = list(default='lhs', rhs='whole milk'))

inspect(milk.association.rules)
  
inspect(head(sort(milk.association.rules, by=c("conf", "supp"))))

top10Rules <- head(milk.association.rules, n=10, by="confidence")

plot(top10Rules, method="graph", engine="htmlwidget")