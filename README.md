# Dockerized Laravel Application with CI/CD Pipeline on AWS

## Project Overview

This project demonstrates how a **Laravel web application can be containerized using Docker and deployed through an automated CI/CD pipeline** on AWS infrastructure.

The goal of this project is to simulate a **real DevOps deployment workflow**, where application code changes are automatically built, packaged, and deployed to a cloud server with minimal manual intervention.

The application is hosted on an **AWS EC2 instance**, connected to an **Amazon RDS database**, and served using **Nginx**. Docker is used to ensure consistent environments across development and deployment.

---

## Architecture Overview

The deployment pipeline follows this workflow:

```
Developer pushes code to GitHub
        ↓
Jenkins Pipeline Triggered
        ↓
Docker Image Built
        ↓
Image Deployed to AWS EC2
        ↓
Application Container Runs
        ↓
Application connects to AWS RDS database
```

This architecture helps automate deployments and reduce configuration issues between environments.

---

## Technologies Used

* **Laravel (PHP)** – Backend application framework
* **Docker** – Containerization of the application
* **Jenkins** – CI/CD automation pipeline
* **AWS EC2** – Application hosting server
* **AWS RDS** – Managed MySQL database
* **Nginx** – Reverse proxy and web server
* **Linux** – Server environment
* **GitHub** – Source code management

---

## Key DevOps Concepts Implemented

### 1. Containerization

The Laravel application is packaged inside a Docker container along with all required dependencies.
This ensures the application runs consistently across development, testing, and production environments.

### 2. CI/CD Automation

A Jenkins pipeline automates the deployment process:

* Pulls latest code from GitHub
* Builds Docker image
* Deploys the updated container on AWS EC2

This reduces manual deployment steps and improves reliability.

### 3. Cloud Deployment

The application is deployed on an **AWS EC2 instance** while the database runs on **Amazon RDS**, providing a managed and scalable database service.


---

## Repository Structure

```
Dockerize-Laravel-app
│
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── src/
│   └── Laravel Application
└── README.md
```

---

## Deployment Workflow

1. Developer pushes code changes to GitHub
2. Jenkins pipeline is triggered automatically
3. Jenkins builds a Docker image for the application
4. The Docker container is deployed on AWS EC2
5. Nginx routes incoming requests to the application container
6. The application connects to the RDS database

---

## Screenshots

* Jenkins pipeline execution
* Docker container running
* AWS EC2 instance dashboard
* Application running in browser
* Architecture diagram (optional)

Example:

```
<img width="1285" height="584" alt="dockerhub-cred-jenkins" src="https://github.com/user-attachments/assets/558c86e4-54e1-47c7-8f20-13f369cb980e" />
<img width="1355" height="605" alt="jenkins pipeline" src="https://github.com/user-attachments/assets/f387e1c4-4960-4ff3-9800-cf01dca9aed0" />
<img width="1365" height="559" alt="jenkins-docker-ec2 sg" src="https://github.com/user-attachments/assets/22c4229d-0629-4012-8634-f0e3e103235c" />
<img width="1337" height="504" alt="Pipeline succesfull" src="https://github.com/user-attachments/assets/298bc357-4c50-4d8e-977c-96ef27d71b69" />
<img width="940" height="386" alt="running containers" src="https://github.com/user-attachments/assets/8cbf8503-ed02-4942-944c-36e1301291e5" />
<img width="1284" height="552" alt="Screenshot 2026-01-30 134040" src="https://github.com/user-attachments/assets/449c40fd-b601-479b-85db-32531e47665e" />

## Learning Outcomes

Through this project I gained hands-on experience with:

* Docker containerization
* CI/CD pipeline automation using Jenkins
* Deploying applications on AWS EC2
* Connecting application services with AWS RDS
* Managing Linux-based production environments
* Troubleshooting deployment and runtime issues

---

## Future Improvements

* Infrastructure provisioning using **Terraform or CloudFormation**
* Container orchestration with **Kubernetes**
* Monitoring using **Prometheus and Grafana**
* Automated security scanning in the CI/CD pipeline

---
**Palak Khandelwal**
DevOps-focused Software Engineer
AWS Certified Solutions Architect – Associate

