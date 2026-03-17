#  Terraform Docker Infrastructure Automation

##  Project Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform to automate Docker container provisioning.

It creates:
- Docker network
- PostgreSQL database container
- Application container (Nginx)
- Container communication setup

---

## Tech Stack
- Terraform
- Docker
- PostgreSQL
- Nginx

---

##  Key Features
- Infrastructure provisioning using Terraform
- Automated container deployment
- Custom Docker network
- Dependency management between services
- One-command cleanup using `terraform destroy`

---

##  Project Structure

terraform-docker-project/
│── main.tf
│── variables.tf
│── outputs.tf
│── README.md
│── .gitignore


---

##  Setup Instructions

### 1. Install Dependencies
- Docker
- Terraform

---

### 2. Initialize Terraform

terraform init


---

### 3. Preview Infrastructure

terraform plan


---

### 4. Deploy Infrastructure

terraform apply


---

### 5. Access Application
Open in browser:

http://localhost:8080


---

### 6. Destroy Infrastructure

terraform destroy


---

## 📸 Output
- Nginx web server running on port 8080
- PostgreSQL database container running

---

##  Learning Outcomes
- Hands-on experience with Infrastructure as Code
- Docker container orchestration using Terraform
- Managing dependencies between services
- Infrastructure lifecycle management

---

##  Future Improvements
- Replace Nginx with Flask application
- Connect application to PostgreSQL
- Add persistent storage using volumes
- Deploy on cloud (AWS/GCP)

---

## 👩‍💻 Author
Aishwarya Ganesh
