CREATE TABLE barcodes (id INTEGER PRIMARY KEY, code TEXT, code_type_id REFERENCES code_types ON DELETE CASCADE, product_id REFERENCES products ON DELETE CASCADE, UNIQUE(code, code_type_id, product_id) ON CONFLICT REPLACE);
CREATE TABLE brands (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE);
CREATE TABLE categories (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE, parent_id REFERENCES categories);
CREATE TABLE category_to_store (id INTEGER PRIMARY KEY, category_id REFERENCES categories ON DELETE CASCADE, store_id REFERENCES stores ON DELETE CASCADE, UNIQUE(category_id, store_id) ON CONFLICT REPLACE);
CREATE TABLE code_types (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE);
CREATE TABLE events (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE);
CREATE TABLE item_to_category (id INTEGER PRIMARY KEY, item_id REFERENCES items ON DELETE CASCADE, category_id REFERENCES categories ON DELETE CASCADE, UNIQUE(item_id, category_id) ON CONFLICT REPLACE);
CREATE TABLE items (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE, parent_id REFERENCES items ON DELETE CASCADE);
CREATE TABLE prices (id INTEGER PRIMARY KEY, product_id REFERENCES products ON DELETE CASCADE, price_date DATE, cents INTEGER);
CREATE TABLE prod_size (id INTEGER PRIMARY KEY, value FLOAT, unit_id REFERENCES units ON DELETE CASCADE);
CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, details TEXT, item_id REFERENCES items ON DELETE CASCADE, brand_id REFERENCES brands ON DELETE CASCADE, prod_size_id REFERENCES prod_size ON DELETE CASCADE);
CREATE TABLE shopping_list (id INTEGER PRIMARY KEY, item_id REFERENCES items, quantity_needed FLOAT, quantity_obtained FLOAT, notes TEXT);
CREATE TABLE stock (id INTEGER PRIMARY KEY, product_id REFERENCES products ON DELETE CASCADE);
CREATE TABLE stock_to_event (id INTEGER PRIMARY KEY, event_id REFERENCES events ON DELETE CASCADE, stock_id REFERENCES stock ON DELETE CASCADE, event_date DATE);
CREATE TABLE stock_to_storage (id INTEGER PRIMARY KEY, stock_id REFERENCES stock ON DELETE CASCADE, storage_id REFERENCES storage ON DELETE CASCADE, UNIQUE(stock_id) ON CONFLICT REPLACE);
CREATE TABLE storage (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE);
CREATE TABLE stores (id INTEGER PRIMARY KEY, name TEXT UNIQUE COLLATE NOCASE);
CREATE TABLE units (id INTEGER PRIMARY KEY, single TEXT UNIQUE COLLATE NOCASE, plural TEXT UNIQUE COLLATE NOCASE, abbrev TEXT UNIQUE COLLATE NOCASE, parent_id REFERENCES units, divisor FLOAT);