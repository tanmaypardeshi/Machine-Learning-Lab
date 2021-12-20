getwd()

df <- read.csv("iris.csv", header=TRUE, sep=",")
head(df)

x <- df[c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
head(x)

y <- df[c("Species")]
head(y)

df.pr <- prcomp(x, center = TRUE, scale = TRUE)
summary(df.pr)

var_explained <- df.pr$sdev^2 / sum(df.pr$sdev^2)
print(var_explained)

screeplot(df.pr, type = "l", npcs = 4, main = "Screeplot of the PCs")
abline(h = 1, col="red", lty=5)
legend("topright", legend=c("Eigenvalue = 1"), col=c("red"), lty=5, cex=0.6)