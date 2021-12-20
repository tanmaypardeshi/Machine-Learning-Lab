library("arules")
library("arulesViz")
library(plyr)

setwd("/home/tanmay/Code/MLA")

getwd()

df <- read.csv("43260_bread_basket.csv", header=TRUE, sep=",")

head(df)

transactionData <- ddply(df, c("Transaction","date_time"), function(df1)paste(df1$Item, collapse = ","))

transactionData$Transaction <- NULL

transactionData$date_time <- NULL

colnames(transactionData) <- c("items")

summary(transactionData)

dim(transactionData)

write.csv(transactionData,"market_basket_transactions.csv", quote = FALSE, row.names = FALSE)

tr <- read.transactions("market_basket_transactions.csv", format = 'basket', sep=',')

itemFrequencyPlot(tr, topN=20, type="absolute")

association.rules <- apriori(tr, parameter = list(supp=0.001, conf=0.3, maxlen=10))

inspect(association.rules)

inspect(head(sort(association.rules, by=c("conf", "supp"))))

shorter.association.rules <- apriori(tr, parameter = list(supp=0.001, conf=0.3, maxlen=2))

inspect(shorter.association.rules)

bread.association.rules <- apriori(tr, parameter = list(supp=0.001, conf=0.3), appearance = list(default='lhs', rhs='Bread'))

inspect(bread.association.rules)

inspect(head(sort(bread.association.rules, by=c("conf", "supp"))))

top10Rules <- head(bread.association.rules, n=10, by="confidence")

plot(top10Rules, method="graph", engine="htmlwidget")
