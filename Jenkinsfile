pipeline {
    agent any

    environment {
        IMAGE_NAME = "palakk1234/laravel-8-crud"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:latest .
                '''
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:latest'
            }
        }

        stage('Deploy on EC2') {
            steps {
                sh '''
                docker compose down || true
                docker compose pull
                docker compose up -d
                '''
            }
        }
    }
}
