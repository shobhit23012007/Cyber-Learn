

# 🚀 **CyberLearn Platform — Modern Architecture Migration**

*A Next-Gen Ethical Hacking & Cybersecurity Learning Platform*

<div align="center">

### ⚡ Complete Migration from Legacy JSP/Servlets → **Spring Boot 3 + React + Docker**

**Secure • Scalable • Cloud-Ready • Containerised Ethical Hacking Labs**

[![Made with Java](https://img.shields.io/badge/Java-17-orange?style=for-the-badge\&logo=java)]()
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3-success?style=for-the-badge\&logo=springboot)]()
[![React](https://img.shields.io/badge/React-19-blue?style=for-the-badge\&logo=react)]()
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge\&logo=docker)]()
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=for-the-badge\&logo=mysql)]()

</div>

---

## 🌐 **Table of Contents**

* [✨ Overview](#-overview)
* [🏗️ Architecture](#️-architecture)
* [🔥 Features](#-features)
* [🧰 Technology Stack](#-technology-stack)
* [⚙️ Prerequisites](#️-prerequisites)
* [⚡ Quick Start](#-quick-start)
* [📁 Project Structure](#-project-structure)
* [🗄️ Database Schema](#️-database-schema)
* [📡 API Documentation](#-api-documentation)
* [🐳 Docker Lab Environments](#-docker-lab-environments)
* [🛠️ Development Guide](#️-development-guide)
* [🚀 Deployment](#-deployment)
* [🐞 Troubleshooting](#-troubleshooting)
* [🎯 Roadmap](#-roadmap)
* [🤝 Contributing](#-contributing)
* [📜 License](#-license)

---

# ✨ **Overview**

CyberLearn is a **next-generation ethical hacking learning platform** that modernizes the old JSP-based system into a **microservice-ready, API-driven, containerized ecosystem** with:

🔐 **Spring Boot 3 Secure REST API**
⚛️ **React + Next.js Modern Frontend**
🐳 **Docker-based Hacking Labs**
🗄️ **MySQL / PostgreSQL Database**
☸️ **Kubernetes-ready deployment**

---

# 🏗️ **Architecture (Animated Layout Style)**

```
🌐 Frontend (React/Next.js)
          ⬇️  JWT Auth
🛠️ Spring Boot REST API
          ⬇️ Database Ops
🗄️ MySQL / PostgreSQL
          ⬇️ Container Management
🐳 Docker Labs (Isolated Hack Environments)
```

---

# 🔥 **Features**

### 🔐 **Authentication**

* JWT + Refresh Tokens
* Role-based access (User/Admin)
* BCrypt-secured passwords

### 📘 **Cybersecurity Courses**

* Difficulty levels (Beginner → Advanced)
* Progress tracking
* Rich course metadata

### 🧨 **Hands-On Hacking Labs**

* SQL Injection
* XSS
* Password Cracking
* Reconnaissance
* All labs run in **isolated Docker containers**

### 🛡️ **Admin Dashboard**

* Manage users, courses, labs
* Monitor lab activity & analytics

### 📘 **Swagger API Docs**

* Built-in interactive API testing

---

# 🧰 **Technology Stack**

### 🚀 Backend

| Component | Tech                     |
| --------- | ------------------------ |
| Framework | Spring Boot 3.3          |
| Language  | Java 17                  |
| Auth      | JWT                      |
| ORM       | JPA / Hibernate          |
| Docs      | OpenAPI/Swagger          |
| Testing   | JUnit 5 + Testcontainers |

### ⚛️ Frontend

| Component | Tech                  |
| --------- | --------------------- |
| Framework | Next.js 15 / React 19 |
| Language  | TypeScript            |
| UI        | Tailwind + Shadcn UI  |
| State     | React Context + SWR   |

### 🐳 Infrastructure

* Docker & Compose
* Kubernetes (Optional)
* GitHub Actions CI/CD

---

# ⚙️ **Prerequisites**

✔️ Docker & Docker Compose
✔️ Java 17
✔️ Node.js 18+
✔️ Git

---

# ⚡ **Quick Start (Super Simple)**

```bash
git clone https://github.com/your-org/cyberlearn.git
cd cyberlearn
docker-compose up -d
```

🎉 **Your platform is now running!**

| Service      | URL                                                                                    |
| ------------ | -------------------------------------------------------------------------------------- |
| Frontend     | [http://localhost:3000](http://localhost:3000)                                         |
| Backend      | [http://localhost:8080/api](http://localhost:8080/api)                                 |
| Swagger Docs | [http://localhost:8080/api/swagger-ui.html](http://localhost:8080/api/swagger-ui.html) |
| SQLi Lab     | [http://localhost:8081](http://localhost:8081)                                         |
| CTF Lab      | [http://localhost:8082](http://localhost:8082)                                         |

---

# 📁 **Project Structure (Visual Map)**

```
cyberlearn/
│── backend/         → Spring Boot API
│── app/             → Next.js frontend
│── labs/            → Docker hacking labs
│── kubernetes/      → K8s deployment manifests
│── deploy/          → CI/CD scripts
│── docs/            → Documentation
│── docker-compose.yml
└── README.md
```

---

# 🗄️ **Database Schema (Core Entities)**

### 👤 users

### 📘 courses

### 🧨 labs

### 🚀 lab_instances

### 🎓 certifications

### 💬 forum_posts

---

# 📡 **API Documentation**

Swagger UI →

```
http://localhost:8080/api/swagger-ui.html
```

Main Endpoints:

### 🔐 Authentication

```
POST /auth/register
POST /auth/login
POST /auth/refresh
```

### 📘 Courses

```
GET /courses
POST /courses (admin)
```

### 🧨 Labs

```
POST /lab-environments/launch
DELETE /lab-environments/instance/{id}
```

---

# 🐳 **Docker Lab Environments**

### 🧪 SQL Injection Lab

**Port:** 8081
**Purpose:** Practice SQLi attacks

### 🕵️‍♂️ CTF Lab

Includes tools: `nmap`, `sqlmap`, `hydra`, `john`, `hashcat`, etc.
**SSH Port:** 2222

---

# 🛠️ **Development Guide**

### Backend

```bash
cd backend
mvn spring-boot:run
```

### Frontend

```bash
npm install
npm run dev
```

---

# 🚀 **Deployment**

### 🔵 Local

```bash
docker-compose up -d
```

### ☸️ Kubernetes (Production)

```bash
./deploy/setup-production.sh
```

---

# 🐞 **Troubleshooting**

### ❗ MySQL connection error

```bash
docker restart cyberlearn-mysql
```

### ❗ Port already in use

```bash
lsof -i :8080
kill -9 <PID>
```

---

# 🎯 **Roadmap**

* [ ] OAuth2 Login
* [ ] AI-based hint system
* [ ] Mobile App (React Native)
* [ ] Real-time lab activity
* [ ] Multi-language support
* [ ] Peer-to-peer lab sharing

---

# 🤝 **Contributing**

👉 Fork → Branch → Commit → PR
Follow **Conventional Commits** + included ESLint rules.

---

# 📜 **License**

**MIT License**

---

<div align="center">

## 🚀 Maintained by **CyberLearn Development Team**

⭐ *If you like this project, consider giving it a star!*

</div>

---

