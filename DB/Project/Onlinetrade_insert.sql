ALTER TABLE activities AUTO_INCREMENT = 1;
-- ALTER TABLE activities DROP visits;
UPDATE actions SET updated_at = created_at WHERE updated_at < created_at;
UPDATE activities SET updated_at = created_at WHERE updated_at < created_at;
UPDATE carts SET updated_at = created_at WHERE updated_at < created_at;
UPDATE discounts SET updated_at = created_at WHERE updated_at < created_at;
UPDATE discounts SET started_at = created_at + INTERVAL 1 WEEK;
UPDATE discounts SET finished_at = started_at + INTERVAL 1 WEEK;
UPDATE orders SET updated_at = created_at WHERE updated_at < created_at;
UPDATE orders_products SET updated_at = created_at WHERE updated_at < created_at;
UPDATE products SET updated_at = created_at WHERE updated_at < created_at;
UPDATE profiles SET updated_at = created_at WHERE updated_at < created_at;
UPDATE users SET updated_at = created_at WHERE updated_at < created_at;
UPDATE carts SET user_id = FLOOR(1 + (RAND() * 300));
UPDATE carts SET product_id = FLOOR(1 + (RAND() * 50));
UPDATE discounts SET user_id = FLOOR(1 + (RAND() * 300));
UPDATE discounts SET product_id = FLOOR(1 + (RAND() * 50));
UPDATE orders SET user_id = FLOOR(1 + (RAND() * 300));
UPDATE orders_products SET product_id = FLOOR(1 + (RAND() * 50));
UPDATE products SET category_id = FLOOR(1 + (RAND() * 20));
UPDATE profiles SET point_of_issue_id = FLOOR(1 + (RAND() * 100));
UPDATE users SET sex = concat(substring('mf', rand() + 1, 1));


INSERT INTO catalogs VALUES
  (NULL, 'Electronics'),
  (NULL, 'Computers and peripherals'),
  (NULL, 'Auto and motorcycle products'),
  (NULL, 'Appliances'),
  (NULL, 'Household products');
 
DESC categories;
INSERT INTO categories VALUES
  (NULL, 1, 'Smartphones'),
  (NULL, 1, 'Mobile phones'),
  (NULL, 1, 'Smartwatch'),
  (NULL, 1, 'Digital players'),
  (NULL, 1, 'E-ink'),
  (NULL, 2, 'Notebook'),
  (NULL, 2, 'System unit'),
  (NULL, 2, 'Video cards'),
  (NULL, 2, 'Memory'),
  (NULL, 2, 'SSD and HDD'),
  (NULL, 3, 'Summer tires'),
  (NULL, 3, 'Winter tires'),
  (NULL, 3, 'All season tires'),
  (NULL, 3, 'Wheels'),
  (NULL, 3, 'Filters and Oils'),
  (NULL, 4, 'Refrigerators'),
  (NULL, 4, 'Wine racks'),
  (NULL, 4, 'Washing machines'),
  (NULL, 4, 'Tumble dryers'),
  (NULL, 4, 'Gas stoves'),
  (NULL, 5, 'Pans'),
  (NULL, 5, 'Frying pans'),
  (NULL, 5, 'Knives'),
  (NULL, 5, 'Kitchen utensilss'),
  (NULL, 5, 'Built-in appliances');
 
 
 INSERT INTO user_privilegies (name) VALUES
  ('Regular customer'),
  ('Vip customer');