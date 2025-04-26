CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

INSERT INTO products (name, description, price, image_url) VALUES
('Chocolate Cake', 'Rich chocolate layer cake with ganache', 29.99, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587'),
('Sourdough Bread', 'Artisanal sourdough bread', 8.99, 'https://images.unsplash.com/photo-1585238342028-50d4b1a1ff6f'),
('Blueberry Muffin', 'Moist muffin loaded with blueberries', 3.99, 'https://images.unsplash.com/photo-1608198093002-ad4e0054842b'),
('Croissant', 'Buttery, flaky French pastry', 4.50, 'https://images.unsplash.com/photo-1587840171670-8b850147754e');
