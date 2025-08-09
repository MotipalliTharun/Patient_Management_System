Got it ✅ — I’ll rewrite your README so it clearly states:

* **Auth Service** → has its own PostgreSQL DB (**auth-service-db**)
* **Patient Service** → has its own PostgreSQL DB (**patient-service-db**)
* **Patient Service** supports **Create, Read, Update, Delete (CRUD)** operations for patient records.

Here’s the updated **polished README.md**:

````markdown
# 🏥 Patient Management System - Java Spring Microservices

## 📌 Overview
The **Patient Management System** is a **Java 21** and **Spring Boot**-based microservices architecture for managing patients, billing, analytics, and authentication.  
It demonstrates **gRPC**, **Kafka messaging**, **JWT authentication**, and **API Gateway routing**.  

Key Features:
- **User authentication** with JWT tokens.
- **Full CRUD** operations for patient records.
- **Event-driven** analytics using Kafka.
- **Inter-service communication** via gRPC.
- **Service isolation** with separate databases.

---

## 🏗 Architecture

| Service | Description | Communication | Database |
|---------|-------------|---------------|----------|
| **API Gateway** | Routes all incoming requests to appropriate services | HTTP | None |
| **Auth Service** | Handles authentication & JWT token generation | HTTP via Gateway | **auth-service-db** (PostgreSQL) |
| **Patient Service** | Full CRUD for patient records, produces Kafka events, calls Billing Service via gRPC | HTTP via Gateway, Kafka Producer, gRPC Client | **patient-service-db** (PostgreSQL) |
| **Billing Service** | Processes billing info via gRPC | gRPC Server | None |
| **Analytics Service** | Consumes patient events from Kafka for analytics | Kafka Consumer | None |
| **Databases** | Two PostgreSQL instances (one for Auth Service, one for Patient Service) | JDBC | PostgreSQL |

---

## 🔌 Technologies Used
- **Java 21**
- **Spring Boot** (Web, Data JPA, Security)
- **Spring Kafka**
- **gRPC** (`grpc-spring-boot-starter`)
- **PostgreSQL**
- **Docker & Docker Compose**
- **JWT Authentication** (`jjwt`)
- **Maven** (Build Tool)
- **Integration Testing** (Spring Boot Test)

---

## ⚙️ Service Ports

| Service | Port |
|---------|------|
| API Gateway | **4004** |
| Auth Service | **8081** |
| Patient Service | **8082** |
| Billing Service (gRPC) | **9005** |
| Analytics Service | **8084** |
| Kafka (external) | **9094** |

---

## 🗄 Environment Variables

### **Auth Service**
```env
SPRING_DATASOURCE_URL=jdbc:postgresql://auth-service-db:5432/authdb
SPRING_DATASOURCE_USERNAME=admin_user
SPRING_DATASOURCE_PASSWORD=password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_SQL_INIT_MODE=always
````

### **Patient Service**

```env
SPRING_DATASOURCE_URL=jdbc:postgresql://patient-service-db:5432/patientdb
SPRING_DATASOURCE_USERNAME=admin_user
SPRING_DATASOURCE_PASSWORD=password
SPRING_JPA_HIBERNATE_DDL_AUTO=update
SPRING_SQL_INIT_MODE=always
```

---

## 📂 Project Structure

```
patient-management-system/
├── api-gateway/          # Spring Cloud Gateway
├── auth-service/         # JWT-based authentication (auth-service-db)
├── patient-service/      # CRUD operations, Kafka producer, gRPC client (patient-service-db)
├── billing-service/      # gRPC billing server
├── analytics-service/    # Kafka consumer for analytics
├── integration-tests/    # Tests for Auth & Patient services
├── docker-compose.yml    # Infrastructure & service orchestration
└── README.md
```

---

## 🚀 Running the Project

### 1️⃣ Start Infrastructure (DBs, Kafka, Zookeeper, etc.)

```bash
docker-compose up -d
```

### 2️⃣ Build All Services

```bash
mvn clean install
```

### 3️⃣ Run Services Individually

```bash
cd patient-service
mvn spring-boot:run
```

### 4️⃣ Run All Services via Docker Compose

```bash
docker-compose up --build
```

---

## 🌐 API Gateway

**Base URL:**

```
http://localhost:4004
```

**Auth Endpoints:**

| Method | Endpoint         | Description           |
| ------ | ---------------- | --------------------- |
| POST   | `/auth/register` | Create new user       |
| POST   | `/auth/login`    | Login & get JWT token |

**Patient Endpoints (JWT Required):**

| Method | Endpoint         | Description            |
| ------ | ---------------- | ---------------------- |
| POST   | `/patients`      | Create a new patient   |
| GET    | `/patients`      | List all patients      |
| GET    | `/patients/{id}` | Get a patient by ID    |
| PUT    | `/patients/{id}` | Update patient details |
| DELETE | `/patients/{id}` | Delete a patient       |

---

## 🔄 Service Communication

* **Auth Service** ⟷ Clients (REST, JWT)
* **Patient Service** ⟶ **Billing Service** (gRPC)
* **Patient Service** ⟶ **Kafka Topic** `patient-events`
* **Analytics Service** ⟵ **Kafka Topic** `patient-events`

---

## 🧪 Integration Tests

### **Auth Service Tests**

* ✅ User registration
* ✅ Login & token retrieval
* ✅ Token validation for protected endpoints

### **Patient Service Tests**

* ✅ Create patient record
* ✅ Retrieve patient list
* ✅ Update patient record
* ✅ Delete patient record
* ✅ Verify Kafka event publishing

**Run all tests:**

```bash
mvn clean test
```

**Run only integration tests:**

```bash
mvn verify -Pintegration-tests
```

---

## 📜 License

This project is for educational purposes, inspired by the Java/Spring Microservices Course by Chris Blakely.
All rights reserved © 2025.

```

---

