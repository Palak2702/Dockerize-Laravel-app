
#  Laravel CI/CD Deployment using Docker, Jenkins & AWS EC2




## Project Overview (Images are added for pipeline flow "all_images_of_ci_cd")

This project demonstrates a complete CI/CD pipeline for a Laravel application using:

* PHP 7.1.3 (initial local setup using WAMP)
* Docker (Application Containerization)
* Jenkins (CI/CD Automation)
* AWS EC2 (Production Server)
* GitHub (Source Code Management)
* Docker Hub (Image Registry)

The objective of this project was to automate:

* Application build
* Docker image creation
* Image push to Docker Hub
* Deployment on AWS EC2
* Automatic container restart on new builds

---

#  Architecture Flow

```
Developer → GitHub → Jenkins → Docker Build → Docker Hub → EC2 Deployment → Live Application
```

---

#  Tech Stack Used

* PHP 7.1.3
* Laravel
* Docker
* Docker Compose
* Jenkins
* AWS EC2 (Ubuntu)
* GitHub
* Docker Hub

---

# 🔹 Step 1: Dockerizing the Laravel Application

Created the following files:

* `Dockerfile`
* `docker-compose.yml`

These files are included in this repository.

---

## 🐳 Docker Commands Used

```bash
# Build Docker Image
docker build -t laravel-app .

# Run Container
docker run -d -p 8000:80 --name laravel-container laravel-app

# Check Running Containers
docker ps

# View Logs
docker logs laravel-container

# Stop Container
docker stop laravel-container

# Remove Container
docker rm laravel-container
```

---

# 🔹 Step 2: Push Docker Image to Docker Hub

```bash
# Tag Image
docker tag laravel-app username/laravel-app

# Login to Docker Hub
docker login

# Push Image
docker push username/laravel-app
```

---

# 🔹 Step 3: AWS EC2 Server Setup

Created an EC2 instance on AWS with:

* Ubuntu OS
* Opened ports: 22 (SSH), 80 (HTTP), 8080 (Jenkins)

---

## Install Docker on EC2

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu
```

Re-login to apply group changes.

---

## Deploy Application on EC2

```bash
# Pull Image
docker pull username/laravel-app

# Run Container on Port 80
docker run -d -p 80:80 --name laravel-container username/laravel-app
```

---

## ⚠ Errors Faced on EC2 & Solutions

| Error                       | Reason                                | Solution                                        |
| --------------------------- | ------------------------------------- | ----------------------------------------------- |
| Site not accessible         | Port 80 not allowed in security group | Enabled HTTP (Port 80) in EC2 security group    |
| Docker permission denied    | User not added to docker group        | Added user to docker group & re-logged in       |
| Container exits immediately | Missing `.env` file                   | Added environment file before running container |
| Port already in use         | Another service using port 80         | Stopped conflicting container/service           |

---

# 🔹 Step 4: Jenkins CI/CD Setup

Installed Jenkins on EC2 and accessed via:

```
http://EC2_PUBLIC_IP:8080
```

Installed required plugins:

* Git Plugin
* Docker Plugin
* Pipeline Plugin

---

## Jenkins Pipeline

The `Jenkinsfile` is included in this repository.

The pipeline performs:

1. Clone repository from GitHub
2. Build Docker image
3. Tag image
4. Push image to Docker Hub
5. Stop existing container (if running)
6. Deploy updated container

---

##  Errors Faced in Jenkins & Fixes

| Error                    | Reason                           | Solution                          |
| ------------------------ | -------------------------------- | --------------------------------- |
| Docker permission denied | Jenkins user not in docker group | `sudo usermod -aG docker jenkins` |
| Git clone failed         | Missing GitHub credentials       | Configured credentials in Jenkins |
| Docker push denied       | Not logged into Docker Hub       | Configured Docker credentials     |
| Build failed             | Incorrect image name             | Corrected tagging format          |

---

# 🔥 Final Working CI/CD Flow

1. Developer pushes code to GitHub
2. Jenkins pipeline triggers automatically
3. Docker image is built
4. Image is pushed to Docker Hub
5. EC2 pulls latest image
6. Existing container is stopped
7. New container runs with updated code
8. Application becomes live on Public IP

---

#  Key Learnings

* Environment consistency is critical
* Docker permissions are a common blocker
* EC2 security groups must allow correct ports
* Jenkins user configuration is essential
* Proper image tagging avoids deployment issues
* Clearing Laravel cache helps avoid production bugs

---

#  DevOps Skills 

✔ Docker Image Creation
✔ Container Lifecycle Management
✔ CI/CD Pipeline Automation
✔ Jenkins Pipeline Scripting
✔ AWS EC2 Deployment
✔ Production Issue Debugging
✔ Docker Hub Integration

---

#  Future Improvements

* Add Nginx reverse proxy
* Add MySQL as a separate Docker container





