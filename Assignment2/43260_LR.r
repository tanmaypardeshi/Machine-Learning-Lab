library("Metrics")

getwd()

df <- read.csv("IceCreamData.csv", header=TRUE, sep=',')
head(df)

# Pass 1

train_data1 <- df[1:375,]
test_data1 <- df[376:500,]

model1 <- lm(Revenue ~ Temperature, data=train_data1)
summary(model1)

plot(train_data1$Temperature, train_data1$Revenue)
abline(model1)

res1 <- predict(model1, test_data1)
print(res1)

mse1 <- mse(res1, test_data1$Revenue)
print(mse1)

# Pass 2

train_data2 <- df[1:320,]
test_data2 <- df[321:500,]

model2 <- lm(Revenue ~ Temperature, data=train_data2)
summary(model2)

plot(train_data2$Temperature, train_data2$Revenue)
abline(model2)

res2 <- predict(model2, test_data2)
print(res2)

mse2 <- mse(res2, test_data2$Revenue)
print(mse2)

# Pass 3

train_data3 <- df[1:400,]
test_data3 <- df[401:500,]

model3 <- lm(Revenue ~ Temperature, data=train_data3)
summary(model3)

plot(train_data3$Temperature, train_data3$Revenue)
abline(model3)

res3 <- predict(model3, test_data3)
print(res3)

mse3 <- mse(res3, test_data3$Revenue)
print(mse3)


# Pass 4

train_data4 <- df[1:300,]
test_data4 <- df[301:500,]

model4 <- lm(Revenue ~ Temperature, data=train_data4)
summary(model4)

plot(train_data4$Temperature, train_data4$Revenue)
abline(model4)

res4 <- predict(model4, test_data4)
print(res4)

mse4 <- mse(res4, test_data4$Revenue)
print(mse4)
