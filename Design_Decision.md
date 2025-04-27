**# 1. Backend Language: Python (Flask)**
**Q Why Flask?**

Flask is lightweight and fast for building REST APIs.

Flask has excellent extensions for PostgreSQL (psycopg2), Redis (redis-py), and RabbitMQ (pika).

It allowed quick development with clean structure and easy maintenance.

**# 2. Database: PostgreSQL**
**Why PostgreSQL?**

PostgreSQL is reliable, open-source, and supports complex queries.

Ideal for structured bakery data like products, orders, and inventory management.

Easy to run inside Docker and manage persistence via volumes.

**# 3. Frontend Framework: React.js**
**Why React?**

React allows building dynamic, single-page applications.

React’s component-based architecture makes the UI modular and maintainable.

Easy to fetch and render product data from the backend API.

**# 4. Message Queue: RabbitMQ**

**Why RabbitMQ?**

RabbitMQ enables asynchronous communication between backend and worker services.

It decouples order creation from order processing, improving system responsiveness.

Message durability ensures orders are not lost even if services restart.

**# 5. Caching Layer: Redis**

**Why Redis?**

Redis provides in-memory caching to accelerate the GET /api/products endpoint.

Reduces database load by serving frequent requests from cache.

TTL (Time-To-Live) feature automatically expires cache entries, keeping data fresh.

**# 6. Worker Service**

**Why a Worker Service?** 

Separating order processing from the backend avoids blocking API responses.

The worker pulls messages from RabbitMQ and processes them independently.

Improves scalability and system resilience.

** # 7. Containerization: Docker & Docker Compose**
**Why Containerize?**

Containers ensure consistent environments across development and production.

Easy orchestration and scaling using Docker Compose.

Services are isolated, networked securely, and can be restarted independently.

**8. Health Checks**

**Why Health Checks?**

Health checks ensure that containers are running properly.

Docker Compose can detect and restart unhealthy services automatically.

**# 9. Environment Variables**

**Why Use .env?**

Environment variables separate sensitive information from source code.

Easy to manage different setups (development, production) without changing the codebase.

**# 10. Volumes for Persistence**
**Why Volumes?**

Database and RabbitMQ volumes persist critical data even when containers are destroyed.

Ensures important bakery system information (products, orders) is not lost on restarts.

🌟 Conclusion

The Bakery System architecture follows modern best practices:

Decoupled services (API, Queue, Worker)

Fast response time (caching)

High availability (persistent volumes + health checks)

Scalable (via container orchestration)

Each design decision was made with performance, maintainability, and scalability in mind.

