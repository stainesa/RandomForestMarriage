# Classification forest
ranger(Species ~ ., data = iris)
train.idx <- sample(nrow(iris), 2/3 * nrow(iris))
iris.train <- iris[train.idx, ]
iris.test <- iris[-train.idx, ]
rg.iris <- ranger(Species ~ ., data = iris.train)
pred.iris1 <- predict(rg.iris, data = iris.test)
table(iris.test$Species, pred.iris1$predictions)
pred.iris2 <- predict(rg.iris, data = iris.test, predict.all = TRUE)
P.I2 <- as_tibble(predictions(pred.iris2))
View(P.I2)




x <- list(list(a = 2:1, c = list(b1 = 2), b = list(c2 = 3, c1 = 4)))
x |> str()

#Transform each leaf
x |> modify_tree(leaf = \(x) x + 100) |>  str()

x <- list(x = 1:10, y = 4, z = list(a = 1, b = 2))
str(x)

# Remove values
str(list_assign(x$z, a = zap()))


ModelBiassedSims |> str()
ModelBiassedSims |> names()
str(list_assign(ModelBiassedSims, PREDICTIONS = zap()))
purrr::discard(ModelBiassedSims,.p = ~stringr::str_detect(.x,"PREDICTIONS")) |> str()
purrr::discard(ModelBiassedSims,.p = ~is_tibble(.x)) |> str()
purrr::discard(ModelBiassedSims,.p = ~!is_tibble(.x)) |> str()


ModelBiassedSims[-which(names(ModelBiassedSims)=="PREDICTIONS")]

names(ModelBiassedSims)[,]

