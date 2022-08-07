create database receptes;
USE receptes;

CREATE TABLE
  recipes (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    description multilinestring DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
  );

CREATE TABLE
  units (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
  );

CREATE TABLE
  ingredients (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    unit INT unsigned NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name),
    FOREIGN KEY (unit) REFERENCES units (id) ON DELETE RESTRICT ON UPDATE CASCADE
  );

CREATE TABLE
  recipe_has_ingredient (
    recipe_id INT UNSIGNED NOT NULL,
    ingredient_id INT UNSIGNED NOT NULL,
    quantity FLOAT DEFAULT 0 NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE RESTRICT ON UPDATE CASCADE
  );

CREATE TABLE
  online_shopping_services (
    id INT unsigned NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY name (name)
  );

CREATE TABLE
  ingredient_buying_reference (
    ingredient_id INT unsigned NOT NULL,
    service_id INT unsigned NOT NULL,
    link LINESTRING NOT NULL,
    price FLOAT NOT NULL,
    quantity FLOAT NOT NULL,
    PRIMARY KEY (ingredient_id, service_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (service_id) REFERENCES online_shopping_services (id) ON DELETE RESTRICT ON UPDATE CASCADE
  );

