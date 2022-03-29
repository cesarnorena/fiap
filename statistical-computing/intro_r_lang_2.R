seller1 <- c("Nike", "Adidas", "Olympikus")
seller2 <- c("Adidas", "Mizuno", "Topper")

union(seller1, seller2)
intersect(seller1, seller2)
setdiff(seller1, seller2)
setdiff(seller2, seller1)

rice_brands <- c("Camil", "Tio João", "Prato Fino")
beans_brands <- c("Kicaldo", "Milano", "Urbano")
interaction(rice_brands, beans_brands)

a <- c("Shirt 1", "Shirt 2")
b <- c("Pants 1", "Pants 2")
expand.grid(a, b)

products <- c("TV", "Fridge", "Notebook", "Cellphone")
quantities <- c(30, 36, 20, 15)

quantities > 10
quantities > 29
quantities[quantities > 29]

quantities[3] <- 60
quantities[3] == 60
quantities2 <- quantities * 2

products == "TV"

names <- c("Maria", "Cesar", "Camilo", "Luisa", "Paula")
match("Paula", names)
names[5]





















