# Quote R
citation()

# Graphic sample
demo(persp)


# R like calculator
4 + 6
7 - 9
4 / 2
4 %% 2
4 * 3
2 ** 3
2 ^ 3
log(2)
log(1)
factorial(5)
abs(-10)
sin(30) # R works with radian, not degrees
sin(pi/6)
cos(pi/3)


# Main objects in R
## Vectors
## Sequences
## Matriz
## Factors
## Arrays
## Lists
## Data Frames
## Functions

# Vectors ---------------------
x <- c(3, 4, 5)
sales <- c(12, 15, 3, 5, 100, 40, 60)
months <- c("jan", "feb", "mar", "apr", "may")
salesFromConsole <- scan()
salesFromConsole
gender <- c("male", "female")

months[1]
months[1:3]
months[6] <- "jun"
months

sales[c(1, 3)] <- c(1, 10)
sales

length(sales)
sales + 2
sales * 10
sales ^ 2
log(sales)
mean(sales)
max(sales)
min(sales)
sort(sales)
sort(sales, decreasing = T)


# ----------------------------









