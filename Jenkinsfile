pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub') // use your actual ID here
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
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Tag & Push Image') {
            steps {
                sh 'docker tag $IMAGE_NAME $DOCKER_HUB_CREDENTIALS_USR/$IMAGE_NAME:latest'
                sh 'docker push $DOCKER_HUB_CREDENTIALS_USR/$IMAGE_NAME:latest'
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker rm -f django-ecommerce-app || true'
                sh 'docker run -d -p 8000:8000 --name django-ecommerce-app $DOCKER_HUB_CREDENTIALS_USR/$IMAGE_NAME:latest'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
