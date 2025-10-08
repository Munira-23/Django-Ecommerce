# 🛍️ Django E-commerce

## 📘 Overview
This project is a **Django-based e-commerce web application** that has been fully containerized using **Docker**.  
It integrates **Jenkins** for Continuous Integration and Continuous Deployment (CI/CD), and implements **monitoring** using **Prometheus** and **Grafana**.  
The project is deployed on an **AWS EC2 instance**.

---

## ⚙️ Features
- 🐳 **Dockerized Django application**
- 🔁 **Jenkins CI/CD pipeline** for automated build, test, and deployment
- 📊 **Monitoring stack** using Prometheus (metrics collection) and Grafana (visualization)
- ☁️ **Deployed on AWS EC2**
- 🔐 Environment isolation and container orchestration using `docker-compose`

---

## 🏗️ System Architecture
The architecture includes the following components:
- **Jenkins** – Automates CI/CD pipeline (build, push, deploy)
- **Docker Hub** – Stores the built Docker image
- **EC2 Instance** – Runs the containers for Django, Prometheus, and Grafana
- **Prometheus** – Scrapes metrics from the Django container
- **Grafana** – Visualizes metrics collected by Prometheus

---

## 🚀 Project Setup

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Munira-23/Django-Ecommerce.git
cd Django-Ecommerce
2️⃣ Build and Run Containers
docker-compose up -d



