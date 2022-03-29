# 1
clients = c("Marcos de Aguiar", "Paula Miranda", "Emilio Santos", "Priscila de Albuquerque")

# 2
clients[4] <- "Pryscilla de Albuquerque"

# 3
salaries <- c(4000, 2500, 1200, 3400)

# 4
salaries <- salaries * 0.7

# 5
a <- 3 + 4 * 5 - 76 / 2
b <- 3 + (4 * 5) - (76 / 2)
c <- (3 + 4) * 5 - 76 / 2

# a FALSE
a == b && b == c

# b FALSE
b < a

# c FALSE
c < b

# d TRUE
a == b

# e FALSE
a > 0 && c > 0

# 6
# All of the are wrong

# a <- "a" "b" "c"
# b <- c("a" "b" "c")
# c <- c(a, b, c)
# d <- a, b, c
# e <- c("a"; "b"; "c")

# 7
# d
ages <- c(13, 14, 8)

# 8
test1 <- c(8, 9, 5, 6, 7, 8, 8, 8, 5)
test2 <- c(2, 3, 4, 3, 6, 4, 2, 9, 5)
test3 <- c(1, 6, 2, 9, 1, 10, 2, 9, 2)

# a FALSE
test1[test1 > 7]

# b FALSE
test2[test2 == 7]

# c FALSE
test3[c(2, 4, 6)]

# d TRUE
length(test2[test2 != 4])

# 9
test1 <- c(3, 6, 4, 2, 7, 8, 5, 6)
test2 <- c(6, 10, 3, 6, 4, 2, 7, 5)
test3 <- c(10, 10, 5, 7, 4, 2, 6, 7)

# a FALSE
sum(test1, test2, test3)

# b TRUE
100 * ((test2 - test1) / test1)

# c FALSE
mean(test1)

# d FALSE
length(test1[test1 < test2])




