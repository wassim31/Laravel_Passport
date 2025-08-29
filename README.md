# Laravel 11 REST API with Passport Authentication

A complete REST API built with Laravel 11 and Laravel Passport for authentication and product management, containerized with Docker.

## 🚀 Features

- User registration and login endpoints
- JWT token-based authentication using Laravel Passport
- Full Docker containerization (Laravel app + MySQL database)
- Comprehensive validation and error handling
- MySQL database running in Docker container
- **Interactive Swagger API Documentation**
- Product CRUD operations with authentication

## 📋 Prerequisites

- Docker and Docker Compose
- Git
- Postman or curl for API testing

## 🛠️ Installation & Setup

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd Laravel-11-REST-API-using-Passport
```

### 2. Environment Setup

Copy the environment file and configure your settings:

```bash
cp .env.example .env
```

### 3. Build and Start Docker Containers

```bash
# Build and start all containers (Laravel app + MySQL database)
docker-compose up -d --build

# Verify containers are running
docker ps

# You should see both Laravel app and MySQL containers running
```

The Docker setup includes:
- **Laravel Application Container**: Running PHP, Nginx, and your Laravel app
- **MySQL Database Container**: Running MySQL database server
- **Shared Network**: Both containers can communicate with each other

### 4. Install Dependencies

```bash
# Get your container ID
docker ps

# Access the container (replace CONTAINER_ID with your actual container ID)
docker exec -it CONTAINER_ID bash

# Inside the container, install dependencies
composer install
```

### 5. Generate Application Key

```bash
# Inside the container
php artisan key:generate
```

### 6. Run Database Migrations

```bash
# Inside the Laravel container, run migrations to create tables in the MySQL container
php artisan migrate

# The migration will create tables in the MySQL database container
```

### 7. Setup Laravel Passport (CRITICAL STEP)

This is crucial for the authentication to work properly:

```bash
# Inside the container
# Install Passport and generate keys
php artisan passport:install

# If you get "table already exists" errors, just continue with:
php artisan passport:keys --force

# Create a personal access client for token generation
php artisan passport:client --personal
# Press Enter to accept the default name
```



## 📚 API Documentation (Swagger)

### How to Use Swagger Documentation:

1. **Open the Documentation**: Navigate to `http://localhost:8000/docs`
2. **Authenticate**: 
   - First register/login using the Authentication endpoints
   - Copy the received token
   - Click "Authorize" button in Swagger UI
   - Enter: `Bearer YOUR_TOKEN_HERE`
3. **Test Endpoints**: Use the "Try it out" button on any endpoint
4. **View Responses**: See live API responses and status codes
