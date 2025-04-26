#  Bakery Management System

A containerized web-based application designed to streamline bakery inventory and order processing using a microservices architecture.

---

## System Architecture

This solution consists of the following core services:

- PostgreSQL: Acts as the primary database, storing products, orders, and item details.
- Redis: Used as a cache layer for faster access to product and order information.
- RabbitMQ: Handles message queuing for asynchronous order processing.
- Flask Backend API: Provides REST endpoints for frontend communication and business logic.
- React Frontend: A responsive interface that allows users to view and order bakery items.
- Worker Service: A background service that listens to the RabbitMQ queue and processes orders.

---

##  Application Flow

1. Customers browse the product catalog through the frontend.
2. When an order is placed, the backend stores it in PostgreSQL and publishes a message to RabbitMQ.
3. The worker service picks up the message and processes the order in the background.
4. As processing continues, order status updates are reflected in the database.

---

  Getting Started

 Prerequisites

Ensure you have the following installed:

- Docker and Docker Compose
- Git

 Installation

1. Clone the project repository:
   bash
   git clone <repository-url>
   cd bakery-system
   

2. Start the application:
   bash
   docker-compose up -d
   

3. Access the services:
   - Frontend: [http://localhost:3000](http://localhost:3000)
   - Backend API: [http://localhost:5000/api/products](http://localhost:5000)
   - RabbitMQ UI: [http://localhost:15672](http://localhost:15672)  
     (Username: guest, Password: guest)

Stopping the App

To shut down all services:
bash
docker-compose down


 Rebuilding After Changes

If you've made updates to the source code:
bash
docker-compose build
docker-compose up -d


---

  API Endpoints

  Products

GET /api/products  
Fetch all available bakery products.

Response:
json
[
  {
    "id": 1,
    "name": "Chocolate Cake",
    "description": "Rich chocolate layer cake with ganache",
    "price": 29.99,
    "image_url": "chocolate_cake.jpg"
  }
]


---

Orders

*POST* /api/orders  
Create a new customer order.

*Sample Request*:
json
{
  "customer_name": "Khushi Pandey",
  "customer_email": "khushi@example.com",
  "items": [
    {
      "product_id": 1,
      "quantity": 2,
      "price": 29.99
    }
  ]
}


*Response*:
json
{
  "order_id": 1,
  "status": "pending",
  "queue_status": "sent to processing queue"
}


---

*GET* /api/orders/{order_id}  
View the status of an individual order.

*Sample Response*:
json
{
  "order_id": 1,
  "customer_name": "Khushi Pandey",
  "status": "processing",
  "created_at": "2023-04-02 15:30:45",
  "items": [
    {
      "product_name": "Chocolate Cake",
      "quantity": 2,
      "unit_price": 29.99,
      "total": 59.98
    }
  ]
}


---

### Health Check

GET /health  
Verifies if the system services are running as expected.

*Response*:
json
{
  "status": "ok",
  "services": {
    "database": "healthy",
    "rabbitmq": "healthy",
    "redis": "healthy"
  }
}
---
 Design Decisions

 Container Strategy

- Each component is containerized separately to promote modularity and scalability.
- Volumes are attached to PostgreSQL, Redis, and RabbitMQ to retain state across reboots.
- Health checks are defined for essential services to monitor uptime.

---

Advanced Features

Redis Integration

- Speeds up product listing access using in-memory caching.
- Temporarily stores order data for quicker UI updates.
- Includes cache invalidation to maintain data consistency.

 Background Worker

- Orders are processed in the background through RabbitMQ.
- Includes retry logic for failed processing attempts.
- Updates order status automatically post-processing.

---

Security Aspects

- Uses environment variables to protect sensitive information.
- Containers run in isolated environments.
- Docker networks ensure controlled service communication.

---
