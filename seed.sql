CREATE DATABASE sainsburys_kingsmead;
USE sainsburys_kingsmead;

CREATE TABLE aisles (
  aisle_id INT PRIMARY KEY,
  aisle_name VARCHAR(150) NOT NULL
);

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(255) NOT NULL,
  aisle_id INT NOT NULL,
  FOREIGN KEY (aisle_id) REFERENCES aisles(aisle_id)
);
INSERT INTO products (product_name, aisle_id) VALUES
('Fajita Kit', 8), ('Taco Kit', 8), ('Wraps', 8), ('Salsa', 8), ('Mexican Seasoning', 8),
('Green Pesto', 8), ('Sweet & Sour Pineapple Sauce', 8), ('Dolmio Pasta Sauce', 8),
('Loyd Grossman Sauce', 8), ('Homepride Sauce', 8), ('Mutti Pasta Sauce', 8),
('Olive Oil', 8), ('Sunflower Oil', 8), ('Vegetable Oil', 8),
('Spaghetti', 8), ('Penne', 8), ('Fusilli', 8), ('Lasagne Sheets', 8), ('Gnocchi', 8),
('Pot Noodle', 8), ('Super Noodles', 8), ('Mug Shot', 8),
('Egg Noodles', 8), ('Rice Noodles', 8), ('Ramen Noodles', 8), ('Soba Noodles', 8), ('Udon Noodles', 8),
('Chopped Tomatoes', 8), ('Passata', 8), ('Tomato Puree', 8),
('Mixed Herbs', 8), ('Curry Powder', 8), ('Chilli Flakes', 8),
('Gravy Sticks', 8),
('Coconut Milk', 8), ('Coconut Cream', 8),
('Soy Sauce', 8), ('Oyster Sauce', 8), ('Hoisin Sauce', 8), ('Fish Sauce', 8), ('Sesame Oil', 8),
('Rice Vinegar', 8), ('Mirin', 8),
('Sushi Rice', 8), ('Nori Sheets', 8), ('Wasabi Paste', 8), ('Pickled Ginger', 8),
('Itsu Meal Kit', 8), ('Wagamama Kit', 8), ('Mama Noodles', 8), ('Blue Dragon Kit', 8),
('Sliced Jalapenos', 8);

INSERT INTO aisles (aisle_id, aisle_name) VALUES
(8,'Mexican, Recipe Sauces, Pasta & World Noodles'),
(9,'Indian Sauces, Pickles, Rice & Tinned Goods'),
(10,'Sauces & Dressings, Tea & Coffee'),
(11,'Snacks, Chocolate & Sweets'),
(12,'Crisps, Fizzy Drinks & Sharing Snacks'),
(13,'World Foods, Cereals & Biscuits'),
(16,'Free From, Baking & Tinned Fruits'),
(17,'Spreads, Bread & Cakes (Ambient)'),
(18,'Frozen');

INSERT INTO products (product_name, aisle_id) VALUES
('Gravy Granules', 9), ('Paxo Stuffing', 9), ('Bisto Gravy', 9),
('Sharwoods Korma', 9), ('Pataks Tikka Masala', 9), ('Geetas Curry Sauce', 9),
('Poppadoms', 9), ('Naan Bread', 9),
('Black Olives', 9), ('Green Olives', 9), ('Stuffed Olives', 9),
('Mango Chutney', 9), ('Lime Pickle', 9), ('Garlic Pickle', 9),
('Tinned Tuna', 9), ('Tinned Salmon', 9), ('Tinned Sardines', 9), ('Tinned Mackerel', 9), ('Anchovies', 9),
('Heinz Soup', 9), ('Baxters Soup', 9), ('Sainsburys Soup', 9),
('Tinned Peas', 9), ('Tinned Carrots', 9), ('Tinned Sweetcorn', 9), ('Tinned Potatoes', 9), ('Hearts of Palm', 9),
('Baked Beans', 9), ('Kidney Beans', 9), ('Chickpeas', 9), ('Butter Beans', 9), ('Lentils', 9), ('Dhal', 9),
('Basmati Rice', 9), ('Pilau Rice', 9), ('Jasmine Rice', 9), ('Microwave Rice Pouch', 9),
('Bulgur Wheat', 9), ('Couscous', 9), ('Quinoa', 9),
('Hot Dogs (Tinned)', 9);


INSERT INTO products (product_name, aisle_id) VALUES
('Ketchup', 10), ('Heinz Ketchup', 10), ('Sainsburys Ketchup', 10),
('Hellmanns Mayonnaise', 10), ('Vegan Mayo', 10), ('Salad Cream', 10),
('English Mustard', 10), ('Dijon Mustard', 10), ('Wholegrain Mustard', 10), ('American Mustard', 10),
('Sweet Baby Rays BBQ Sauce', 10), ('Heinz BBQ Sauce', 10),
('Nandos Peri Peri Sauce', 10), ('Tabasco Sauce', 10), ('Cholula Hot Sauce', 10), ('Franks Hot Sauce', 10), ('Sriracha Sauce', 10),
('HP Brown Sauce', 10), ('Daddies Brown Sauce', 10),
('French Dressing', 10), ('Caesar Dressing', 10), ('Balsamic Dressing', 10), ('Ranch Dressing', 10),
('PG Tips Tea', 10), ('Yorkshire Tea', 10), ('Tetley Tea', 10), ('Twinings Tea', 10), ('Herbal Tea', 10),
('Nescafe Coffee', 10), ('Kenco Coffee', 10), ('Lavazza Coffee', 10), ('Starbucks Coffee', 10), ('Ground Coffee', 10), ('Coffee Beans', 10), ('Coffee Pods', 10),
('Granulated Sugar', 10), ('Caster Sugar', 10), ('Icing Sugar', 10), ('Brown Sugar', 10), ('Sugar Cubes', 10), ('Sweeteners', 10),
('UHT Whole Milk', 10), ('UHT Semi Skimmed Milk', 10), ('UHT Skimmed Milk', 10),
('Oat Milk', 10), ('Soya Milk', 10), ('Almond Milk', 10), ('Coconut Milk Drink', 10);


INSERT INTO products (product_name, aisle_id) VALUES
('Cereal Bars', 11), ('Penguin Multipack', 11), ('Club Multipack', 11), ('KitKat Multipack', 11),
('Cadbury Dairy Milk', 11), ('Galaxy Chocolate', 11), ('Lindt Chocolate', 11),
('Truffle Selection Box', 11), ('Ferrero Rocher', 11),
('Haribo Sweets', 11), ('Wine Gums', 11), ('Skittles', 11);


INSERT INTO products (product_name, aisle_id) VALUES
('Coca Cola', 12), ('Pepsi', 12), ('Fanta', 12), ('Sprite', 12), ('Schweppes Tonic', 12),
('Walkers Crisps', 12), ('Doritos', 12), ('Pringles', 12), ('McCoys Crisps', 12),
('Salted Peanuts', 12), ('Dry Roasted Peanuts', 12), ('Cashew Nuts', 12), ('Pistachios', 12),
('Sweet Popcorn', 12), ('Salted Popcorn', 12), ('Toffee Popcorn', 12),
('Monster Energy', 12), ('Red Bull', 12), ('Rockstar Energy', 12), ('Lucozade', 12);


INSERT INTO products (product_name, aisle_id) VALUES
('Weetabix', 13), ('Kelloggs Cornflakes', 13), ('Nestle Cheerios', 13), ('Granola', 13), ('Porridge Oats', 13), ('Muesli', 13),
('Digestive Biscuits', 13), ('Hobnobs', 13), ('Bourbon Biscuits', 13), ('Custard Creams', 13), ('Cookies', 13), ('Crackers', 13),
('Soy Sauce (Kikkoman)', 13), ('Miso Paste', 13), ('Kimchi', 13), ('Seaweed Snacks', 13),
('Polish Pickles', 13), ('Hungarian Sausages', 13), ('Eastern European Sauces', 13),
('Palm Oil', 13), ('Fufu Flour', 13), ('Semolina', 13), ('Yam Flour', 13),
('Tahini', 13), ('Pomegranate Molasses', 13), ('Halva', 13), ('Couscous', 13), ('Bulgur Wheat', 13);


INSERT INTO products (product_name, aisle_id) VALUES
('Gluten Free Bread', 16), ('Dairy Free Biscuits', 16),
('Tinned Peaches', 16), ('Tinned Pears', 16), ('Tinned Pineapple', 16), ('Fruit Cocktail', 16),
('Raisins', 16), ('Sultanas', 16), ('Apricots', 16), ('Figs', 16), ('Dates', 16),
('Cream Crackers', 16), ('Water Biscuits', 16), ('Oatcakes', 16), ('Rice Cakes', 16),
('Jelly Powder', 16), ('Ready-to-eat Jelly Pots', 16),
('Custard Powder', 16), ('Tinned Custard', 16), ('Carton Custard', 16),
('Plain Flour', 16), ('Self Raising Flour', 16), ('Baking Powder', 16), ('Cocoa Powder', 16), ('Chocolate Chips', 16), ('Cake Mix', 16);


INSERT INTO products (product_name, aisle_id) VALUES
('Peanut Butter', 17), ('Crunchy Peanut Butter', 17), ('Smooth Peanut Butter', 17),
('Strawberry Jam', 17), ('Raspberry Jam', 17), ('Marmalade', 17),
('Nutella', 17), ('Cadbury Chocolate Spread', 17),
('Sliced Bread', 17), ('Bread Rolls', 17), ('Bagels', 17), ('Pittas', 17), ('Wraps (Ambient)', 17),
('Sponge Cake', 17), ('Fruit Loaf', 17), ('Madeira Cake', 17), ('Mini Rolls', 17);


INSERT INTO products (product_name, aisle_id) VALUES
('Halal Frozen Chicken', 18), ('Frozen Lamb', 18), ('Frozen Fish Fillets', 18), ('Fish Fingers', 18),
('Frozen Peas', 18), ('Frozen Sweetcorn', 18), ('Frozen Broccoli', 18), ('Mixed Frozen Veg', 18),
('Frozen Berries', 18), ('Frozen Mango', 18), ('Smoothie Mix', 18),
('Vegan Burgers', 18), ('Vegan Sausages', 18), ('Vegan Nuggets', 18),
('Frozen Pizza', 18), ('Frozen Garlic Bread', 18),
('Frozen Gateaux', 18), ('Frozen Cheesecake', 18), ('Profiteroles', 18),
('Ice Cream Tub', 18), ('Ice Lollies', 18),
('Itsu Gyoza', 18), ('Itsu Bao Buns', 18), ('Frozen Ramen Bowl', 18),
('Frozen Croissants', 18), ('Frozen Pain au Chocolat', 18), ('Danish Pastries', 18);


