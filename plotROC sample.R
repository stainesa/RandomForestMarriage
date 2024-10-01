library(plotROC)
set.seed(2529)
D.ex <- rbinom(200, size = 1, prob = .5)
M1 <- rnorm(200, mean = D.ex, sd = .65)
M2 <- rnorm(200, mean = D.ex, sd = 1.5)

test <- data.frame(D = D.ex, D.str = c("Healthy", "Ill")[D.ex + 1],
                   M1 = M1, M2 = M2, stringsAsFactors = FALSE)

basicplot <- ggplot(test, aes(d = D, m = M1)) + geom_roc()
basicplot
ggplot(test, aes(d = D.str, m = M1)) + geom_roc()

ggplot(test, aes(d = D, m = M1)) + geom_roc(n.cuts = 0)


ggplot(test, aes(d = D, m = M1)) + geom_roc(n.cuts = 5, labelsize = 5, labelround = 2)

styledplot <- basicplot + style_roc()
styledplot

styledplot + geom_rocci()

ggplot(test, aes(d = D, m = M1)) + geom_roc(n.cuts = 0) +
    geom_rocci(ci.at = quantile(M1, c(.1, .4, .5, .6, .9))) + style_roc()
