# 🍞 Dockerized Bakery Management System

## 📚 Overview

This project is a containerized Bakery Management System built using Docker Compose. It includes:
- A PostgreSQL database
- A Python Flask backend API
- A React frontend web application
- Redis caching for product listings
- RabbitMQ message queue
- A worker service to process orders asynchronously

All services are containerized and orchestrated via Docker Compose.

 🏛️ System Architecture
 
 ![image](https://github.com/user-attachments/assets/d4a2c60d-812a-4069-bb1f-a6182e0b912d)
 
 
**Setup Instructions**

**1. Clone the repository **

   git clone <repository-link>
   cd bakery-system
   
**2.Create a .env file**

**Build and run the system**
docker-compose up --build

**Access the system**

**Frontend:** http://localhost:3000

**Backend API:** http://localhost:5000/api/products

**RabbitMQ Dashboard**: http://localhost:15672

![image](https://github.com/user-attachments/assets/a522b956-abac-48d2-95c2-0bc625368f48)

**🔋 Technologies Used**

Backend: Flask, psycopg2 (Postgres connector), pika (RabbitMQ), redis-py

Frontend: React.js

Database: PostgreSQL

Caching: Redis

Messaging: RabbitMQ

Containerization: Docker, Docker Compose


**📜 Design Decisions**

Containerization: Each service is isolated, making the system highly maintainable and scalable.

Caching: Redis is used to speed up product listing and reduce database load.

Asynchronous Processing: RabbitMQ + Worker enables non-blocking order processing.

Health Checks: Services have health checks configured to ensure reliability.

**🧹 Clean Up**

To stop and remove all containers:


docker-compose down


