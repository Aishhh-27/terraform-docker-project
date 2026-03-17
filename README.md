# 🚀 Production-Ready Terraform Docker Infrastructure

## 📌 Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform to automate the deployment of a multi-container application.

It provisions a complete environment with:
- Flask application (Python backend)
- PostgreSQL database
- Docker network for communication
- Persistent storage using volumes

---

## 🏗 Architecture

User → Flask App (Docker) → PostgreSQL (Docker Volume)

- Terraform provisions infrastructure
- Docker network connects services
- Volume ensures data persistence
- App communicates with DB internally

---

## 🛠 Tech Stack

- Terraform (Infrastructure as Code)
- Docker (Containerization)
- Flask (Python Web Framework)
- PostgreSQL (Database)

---

## ⚙️ Features

- Infrastructure automation using Terraform
- Multi-container deployment
- Flask app connected to PostgreSQL
- Persistent storage using Docker volumes
- Custom Docker image build
- Dependency management using Terraform
- Full lifecycle management (apply/destroy)

---

## 📁 Project Structure

