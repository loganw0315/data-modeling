--CREATE TABLES
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    user_email VARCHAR(30) NOT NULL UNIQUE,
    user_password VARCHAR(30) NOT NULL,
    user_name VARCHAR(30) NOT NULL,
);

CREATE TABLE recipes(
    recipe_id SERIAL NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    recipe_name VARCHAR(30) NOT NULL,
    recipe_intructions TEXT NOT NULL,
    recipe_privacy BOOLEAN NOT NULL,
);

CREATE TABLE recipe_ingredients(
    ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(30) NOT NULL,
    ingredient_type VARCHAR(30) NOT NULL
);

CREATE TABLE grocery_lists(
   grocery_list_id SERIAL PRIMARY KEY,
   user_id INTEGER NOT NULL REFERENCES users(user_id),
   grocery_list_name VARCHAR(30) NOT NULL,
);

CREATE TABLE grocery_list_ingredients(
    ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id),
    grocery_list_id INTEGER NOT NULL REFERENCES grocery_lists(grocery_list_id)
);

CREATE TABLE occasions(
    occasion_id SERIAL PRIMARY KEY,
    occasions_name VARCHAR(30) NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    
);

CREATE TABLE occasion_recipes(
    occasion_id INTEGER NOT NULL REFERENCES occasions(occasion_id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
);


--INSERTS
INSERT INTO users(user_email, user_password, user_name)
VALUES ('loganw0315@gmail.com','password','loganw');

INSERT INTO recipes(user_id,recipe_name,recipe_intructions,recipe_privacy)
VALUES (1, 'Banana Bread', 'Make it', false);

INSERT INTO recipe_ingredients(ingredient_id, recipe_id)
VALUES (1, 2);

INSERT INTO ingredients(ingredient_name, ingredient_type)
VALUES ('Banana', 'fruit');

INSERT INTO grocery_lists(user_id, grocery_list_name)
VALUES (1, 'my list');

INSERT INTO grocery_list_ingredients(ingredient_id, grocery_list_id)
VALUES (1, 2);

INSERT INTO occasions(occasions_name, user_id)
VALUES ('b-day party', 1);

INSERT INTO occasion_recipes(occasion_id, recipe_id)
VALUES (1, 2);

