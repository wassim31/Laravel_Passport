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

Interactive API documentation is available through Swagger UI:

**Access the API Documentation:**
- **Swagger UI (Browser)**: `http://localhost:8000/docs`
- **OpenAPI JSON Spec**: `http://localhost:8000/docs` (for API clients)
- **Alternative Route**: `http://localhost:8000/api/documentation`

> **Note**: The same `/docs` endpoint serves both the interactive Swagger UI (when accessed via browser) and the OpenAPI JSON specification (when accessed via API clients like curl).

### Features of Swagger Documentation:

1. **Interactive Testing**: Test all endpoints directly from the browser
2. **Authentication Support**: Built-in support for Bearer token authentication
3. **Request/Response Examples**: See exact request and response formats
4. **Parameter Validation**: View all required and optional parameters
5. **Real-time Testing**: Execute API calls and see live responses

### How to Use Swagger Documentation:

1. **Open the Documentation**: Navigate to `http://localhost:8000/docs`
2. **Authenticate**: 
   - First register/login using the Authentication endpoints
   - Copy the received token
   - Click "Authorize" button in Swagger UI
   - Enter: `Bearer YOUR_TOKEN_HERE`
3. **Test Endpoints**: Use the "Try it out" button on any endpoint
4. **View Responses**: See live API responses and status codes

### Generating Updated Documentation:

If you make changes to the API annotations, regenerate the docs:

```bash
# Access the Laravel container
docker exec -it YOUR_CONTAINER_ID bash

# Regenerate Swagger documentation
php artisan l5-swagger:generate
```

## ✅ What's Now Available

After the Docker rebuild with Swagger integration, your API now includes:

### 🔧 **Core Features:**
- ✅ User Registration & Login with JWT tokens
- ✅ Product CRUD operations (Create, Read, Update, Delete)
- ✅ Laravel Passport authentication
- ✅ Full Docker containerization (App + Database)

### 📚 **Documentation Features:**
- ✅ **Interactive Swagger UI** at `http://localhost:8000/docs`
- ✅ **Live API Testing** directly from the browser
- ✅ **Authentication Integration** with Bearer token support
- ✅ **Comprehensive API Examples** with request/response samples

### 🚀 **Ready-to-Use Endpoints:**
- `POST /api/register` - Register new users
- `POST /api/login` - Authenticate users
- `GET /api/products` - List all products (requires auth)
- `POST /api/products` - Create new product (requires auth)
- `GET /api/products/{id}` - Get specific product (requires auth)
- `PUT /api/products/{id}` - Update product (requires auth)
- `DELETE /api/products/{id}` - Delete product (requires auth)

### 🎯 **Quick Start:**
1. Visit `http://localhost:8000/docs` for interactive API documentation
2. Register a user via `/api/register`
3. Copy the token from the response
4. Click "Authorize" in Swagger UI and paste: `Bearer YOUR_TOKEN`
5. Test all endpoints directly from the documentation!