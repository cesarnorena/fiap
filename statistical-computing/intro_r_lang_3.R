0:20
15:20
seq(0, 20, 2)
seq(0, 5, .2)

rep(3, 4)
rep(1:3, 2)

products <- c("TV", "Fridge", "Notebook", "Cellphone")
quantities <- c(30, 36, 20, 15)

rep(products, 2)
rep(products, 1, each = 2)
rep(products, 2, each = 3)

sample(0:30, 10)
sample(0:30, 10, replace = TRUE)
sample(0:30, 10, replace = FALSE)

doc_products <- 100:150
doc_products[1:6]

sells <- rbind(products, quantities)
sells

sells <- cbind(products, quantities)
sells

matrix("name", 4, 5)
matrix(0, 3, 3)
matrix(1:20, nrow = 4, ncol = 5)
matrix(1:20, nrow = 4, ncol = 5, byrow = TRUE)
matrix(1:5, 4, 5, T)
matrix(1:4, 4, 5, F)

sells
sells[1]
sells[1, 1]
sells[1, 2]
sells[1,]
sells[,1]
sells[2,]
sells[,2]
sells[2:3]

sells_jan
sells_jan <- sells
sells_feb <- sells
sells_jan[,2] <- as.numeric(sells_jan[,2]) * 2
sells_jan[1,1] <- "Televisor"
sells_jan[3, ] <- c("PC", 60)
sells_jan[1:4, 2] <- c(20, 30, 40, 50)
sells_jan[, -1]
sells_jan[, -2]
sells_jan[-1, -2]


carlos <- sample(100:300, 10, T)
cesar <- sample(100:300, 10, T)
carolina <- sample(100:300, 10, T)

sell_employees <- cbind(carlos, cesar, carolna)
sell_employees <- sell_employees * .1
sqrt(sell_employees)
log(sell_employees)
sum(sell_employees)

sum(sell_employees[,1]) # Carlos sells

mean(sell_employees[,1])
mean(sell_employees[,2])
mean(sell_employees[,3])
mean(sell_employees)


sell_employees
image(sell_employees)
