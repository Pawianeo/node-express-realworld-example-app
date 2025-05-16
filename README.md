# Node Express Realworld Example App with Jenkins CI/CD

![Logo](project-logo.png)

## 🧪 Project Overview

This project demonstrates a complete CI/CD pipeline for a Node.js API application using Jenkins, Docker, and Postman (Newman).

It includes:

* A backend application built with **Express.js**,
* API tests written and executed in **Postman**,
* A **Jenkins pipeline** that:

  * Installs dependencies
  * Generates the Prisma client
  * Runs automated API tests using Newman

---

## 🛠️ Tech Stack

* **Node.js** / **Express.js** (backend API)
* **Prisma ORM** (PostgreSQL connection)
* **PostgreSQL** (Dockerized DB)
* **Jenkins** (CI/CD server)
* **Docker / Docker Compose** (containerized architecture)
* **Postman / Newman** (automated API tests)

---

## 🐳 Project Structure (Dockerized)

```
📦node-express-realworld-example-app
 ├── Dockerfile
 ├── docker-compose.yml
 ├── jenkins-dockerfile
 ├── Jenkinsfile
 ├── src/                  # Application source code
 ├── tests/                # Postman collection (.json)
 ├── .nx/                  # Nx cache
 ├── dist/                 # Compiled build output
```

---

## ⚙️ How to Run Locally (Development)

1. Clone the repo:

```bash
git clone https://github.com/Pawianeo/node-express-realworld-example-app.git
cd node-express-realworld-example-app
```

2. Start with Docker:

```bash
docker-compose up --build
```

3. Backend will be available at:

```
http://localhost:3000/api
```

4. Verify articles endpoint:

```
GET http://localhost:3000/api/articles
```

---

## 🚀 Jenkins CI/CD Setup

1. Jenkins runs inside a Docker container, using the image defined in `jenkins-dockerfile`.
2. Pipeline is defined in the `Jenkinsfile` and includes:

```groovy
pipeline {
  agent any
  tools {
    nodejs 'node18'
  }
  environment {
    DATABASE_URL = 'postgresql://postgres:postgres@host.docker.internal:5432/postgres'
  }
  stages {
    stage('Install dependencies') {
      steps {
        dir('project') {
          sh 'npm install || true'
        }
      }
    }
    stage('Generate Prisma Client') {
      steps {
        dir('project') {
          sh 'npx prisma generate || true'
        }
      }
    }
    stage('Run Postman tests') {
      steps {
        dir('tests') {
          sh 'newman run realworld.postman_collection.json'
        }
      }
    }
  }
}
```

---

## ✅ Sample Newman Test Results

![Newman tests passed](docs/screenshots/f6c37a23-8a14-4c96-8480-1ec345f8d1b4.png)

* All Postman tests executed successfully
* Covered: registration, login, get current user, create + delete article
* Dynamic data passed using collection variables

---

## 📷 Screenshots

### ✅ Jenkins pipeline (Green build)
![Jenkins pipeline](docs/screenshots/jenkins-pipeline.png.png)

### 🐳 Docker containers running
![Docker containers](docs/screenshots/docker-containers.png.png)

### 🧪 Postman test variables
![Postman variables](docs/screenshots/postman-vars.png.png)

### 📂 Jenkinsfile preview
![Jenkinsfile](docs/screenshots/jenkinsfile.png)

### 🟢 Prisma Client generation
![Prisma success](docs/screenshots/prisma-success.png.png)

(See `/docs/screenshots/` folder or GitHub issue attachments)

---

## 💡 Ideas for Future Expansion

* Add test coverage reports to Jenkins
* Integrate GitHub Webhooks for push builds
* Deploy to staging with Docker Swarm or Kubernetes
* Add email/Slack notifications on failure

---

## 📎 Credits

Fork based on [gothinkster/realworld](https://github.com/gothinkster/realworld) API.

Project customized, dockerized and integrated with CI by **Pawianeo** 🛠️

