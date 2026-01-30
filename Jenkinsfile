pipeline {
    agent any

    environment {
        IMAGE_NAME = "palakk1234/laravel-8-crud"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Palak2702/Dockerize-Laravel-app.git'              
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME:latest .
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                echo "Running basic checks..."
                php -v
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }

        stage('Deploy on EC2') {
            steps {
                sh '''
                docker-compose down
                docker-compose pull
                docker-compose up -d
                '''
            }
        }
    }
}
