# 1
# a - FALSE
seq(10, 100, 10)

# b - FALSE
seq(10, 100, 5)

# c - TRUE
rep(1:4, 3)

# d - FALSE
rep(1:4, 3)

# 2
# a - TRUE
sample(1:50, 5)

# b - FALSE
sample(c("Cara", "Coroa"), 5, replace = T)

# c - FALSE
sample(c(1, 2, 3, 4, 5), 5)

# d - FALSE
sample(c(1, 2, 3, 4, 5, 6), 2)

# 3
# Criar um sample de 30 elementos com salarios entre 10 e 20 vezes o salario minimo
clients <- sample(10:20, 30, replace = T)

# Criar um sample de 5 elementos com index entre 1 e 30
selected_indexes <- sample(1:30, 5)

# Selecionar os 5 indexes
clients[selected_indexes]

# 4
users <- matrix(NA, nrow = 3, ncol = 4, dimnames = list(NULL, c("name", "age", "city", "phone")))
users
users[1,] <- c("Maria das Dores", 56, "São Paulo", "3025-111")
users[2,] <- c("José Aníbal", 40, "Santos", "333-012")
users

# a - FALSE
# b - FALSE
# c - FALSE
# d - FALSE
# e - TRUE

# 5
loan_requests <- matrix(NA, nrow = 4, ncol = 3, dimnames = list(NULL, c("name", "salary", "age")))
loan_requests[1,] <- c("Marcos", 4000, 44)
loan_requests[2,] <- c("Paula", 2500, 56)
loan_requests[3,] <- c("Emilio", 1200, 76)
loan_requests[4,] <- c("Pryscilla", 3400, 40)
loan_requests

# 6
loan_requests[2, "salary"] <- 5500.33
loan_requests[2, 2] <- 5500.33
loan_requests

# 7
loan_requests[,2] <- as.numeric(loan_requests[,2]) * 0.7
loan_requests[,2]
loan_requests

# 8
sum(as.numeric(loan_requests[,2])) / length(loan_requests[,2])
mean(as.numeric(loan_requests[,2]))

# 9
colnames(loan_requests) <- c("Name", "Salary", "Age")
loan_requests
