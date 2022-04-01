-- products
insert into products (name, category, price) values ('Basil - Fresh', 'fresh',0.56),('Veal - Eye Of Round', 'meat',2.67),('Appetizer - Chicken Satay', 'meat',8.35),('Muffin Mix - Chocolate Chip', 'flour',4.61),('Wine - Touraine Azay - Le - Rideau', 'liqueur',2.26),('Flour - Rye', 'flour',4.17),('Nut - Almond, Blanched, Whole','seeds', 6.7),('Salmon Atl.whole 8 - 10 Lb', 'meat',9.63),('Cake Slab', 'bread',6.75),('Mustard - Pommery', 'dressings',7.31),('Almonds Ground Blanched', 'seeds',0.16),('Octopus - Baby, Cleaned','meat', 4.3),('Petit Baguette', 'bread',3.38),('Lemonade - Mandarin, 591 Ml', 'drink',5.33),('Ecolab - Hobart Washarm End Cap', 'meat',4.54),('Sugar - Fine','dressings', 1.7),('Bread - Frozen Basket Variety', 'bread',9.14),('Wine - Charddonnay Errazuriz', 'liqueur',1.79),('Octopus - Baby, Cleaned', 'meat',6.58),('Leeks - Large', 'meat',1.04),('Nantucket - 518ml', 'drink',7.98),('Dr. Pepper - 355ml', 'drink',1.57),('Apples - Spartan','fresh', 5.6),('Ice Cream Bar - Oreo Cone', 'dressings',1.12),('Wine - Red, Antinori Santa', 'liqueur',3.75),('Pasta - Linguini, Dry', 'flour',9.56),('Tea - Jasmin Green', 'drink',3.54),('Clams - Littleneck, Whole', 'meat',0.17),('Praline Paste', 'flour',5.98),('Capon - Breast, Wing On', 'meat',3.24),('Kiwi','fresh', 6.5),('Wine - Pinot Grigio Collavini', 'liqueur',2.64),('Numi - Assorted Teas', 'drink',7.07),('Apron', 'generic',1.55),('Phyllo Dough', 'bread',9.43),('Pasta - Penne, Lisce, Dry', 'flour',5.92),('Bread - Pita', 'bread',8.52),('Snails - Large Canned', 'generic',0.01);

insert into products (name, category, price, deleted_at, details) values ('Ecolab - Mikroklene 4/4 L', 'meat',2.43, now() - '1 month'::interval, '{ "weight": "5kg", "origin": "Scotland" }'), ('Lobster - Tail 6 Oz','meat', 7.6, now() - '1 month'::interval, '{ "weight": "3kg", "origin": "USA" }'), ('General Purpose Trigger', 'generic',3.22, now() - '1 month'::interval, '{ "weight": "5kg", "color": "purple" }'), ('Mushroom - Shitake, Fresh', 'fresh',5.07, now() - '1 month'::interval, '{ "farm": "#545", "origin": "Scotland" }'), ('Turnip - Wax', 'generic',8.59, now() - '1 month'::interval, '{ "weight": "5kg", "color": "white" }'), ('Stock - Veal, White', 'meat',3.95, now() - '1 month'::interval, '{ "weight": "5kg", "origin": "UK" }'), ('Wine - Montecillo Rioja Crianza', 'liqueur',5.51, now() - '1 month'::interval, '{ "harvest": "5/5/98", "origin": "Scotland" }'), ('Garlic - Peeled', 'fresh',5.28, now() - '1 month'::interval, '{ "farm": "#535", "origin": "Scotland" }'), ('Bread - Ciabatta Buns', 'bread',9.03, now() - '1 month'::interval, '{ "cooked": "12/03/22", "origin": "France"}'), ('Chickensplit Half', 'meat',3.23, now() - '1 month'::interval, '{ "weight": "5kg", "origin": "USA" }'), ('Coconut Milk - Unsweetened', 'drink',1.28, now() - '1 month'::interval, '{ "weight": "3kg" }'), ('Turkey Leg With Drum And Thigh', 'meat',8.31, now() - '1 month'::interval, '{ "weight": "5kg", "origin": "Berlin" }');

insert into clients (client_id, full_name, dui) values (1, 'Enoch Cow', '61230693-3'),
(2, 'Nefen Cowdroy', '11158088-8'),
(3, 'Ezequiel Edmenson', '91857028-0'),
(4, 'Norton Truluck', '79509590-8'),
(5, 'Izaak Boullin', '76141129-3'),
(6, 'Susan Belitz', '36905365-8'),
(7, 'Maribelle Orchart', '66758742-9'),
(8, 'Derry Klos', '64111068-1'),
(9, 'Loni Copas', '71138974-3'),
(10, 'Albrecht Fields', '85363300-4'),
(11, 'Darcie Kittow', '44689988-0'),
(12, 'Sheryl Fetherston', '25016604-6'),
(13, 'Artair Menelaws', '26285464-4'),
(14, 'Ulises McLagan', '34398624-2'),
(15, 'Libbi Postins', '52332746-8'),
(16, 'Andie Tweddell', '43371100-1'),
(17, 'Sky Greeve', '99826489-1'),
(18, 'Hugo Messenbird', '14317144-6'),
(19, 'Karia Emerton', '87334166-0'),
(20, 'Nadine Votier', '86300451-6');

INSERT INTO invoices(client_id, product_id) VALUES (1,1), (1,2),(1,3),(1,5),(2,11), (2,12),(2,13), (4,15), (3,7), (3,12),(5,20), (14,35);