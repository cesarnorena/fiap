CREATE TABLE IF NOT EXISTS cars
(
    id                   INTEGER PRIMARY KEY AUTOINCREMENT,
    year                 INTEGER,
    brand                VARCHAR(100),
    model                VARCHAR(100),
    category             VARCHAR(50),
    cylinders            INT,
    fuel                 VARHCAR(50),
    miles_by_gallon_city INT,
    miles_by_gallon_road INT
);

SELECT count(brand)
FROM cars;

SELECT count(model) AS count_model, brand
FROM cars
GROUP BY brand
ORDER BY count_model DESC;

SELECT min(miles_by_gallon_city), model
FROM cars;

SELECT max(miles_by_gallon_city), model
FROM cars;

SELECT DISTINCT model, miles_by_gallon_city
FROM cars
ORDER BY miles_by_gallon_city
LIMIT 10;

SELECT DISTINCT model, miles_by_gallon_road
FROM cars
ORDER BY miles_by_gallon_road
LIMIT 10;

SELECT DISTINCT brand, model, miles_by_gallon_road
FROM cars
ORDER BY miles_by_gallon_road DESC
LIMIT 10;
