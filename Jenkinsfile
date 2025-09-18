pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-creds')
        DOCKER_HUB_USER = "munira123"
        IMAGE_NAME = "django-ecommerce"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'develop',
                    credentialsId: 'github',
                    url: 'https://github.com/Munira-23/Django-Ecommerce.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_USER --password-stdin'
                }
            }
        }

        stage('Tag & Push Image') {
            steps {
                script {
                    sh 'docker tag $IMAGE_NAME $DOCKER_HUB_USER/$IMAGE_NAME:latest'
                    sh 'docker push $DOCKER_HUB_USER/$IMAGE_NAME:latest'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker rm -f django-ecommerce-app || true'
                    sh 'docker run -d -p 8000:8000 --name django-ecommerce-app $DOCKER_HUB_USER/$IMAGE_NAME:latest'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
