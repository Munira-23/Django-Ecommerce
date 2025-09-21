pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "munira123/django-ecommerce"   // replace with your Docker Hub username/repo
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop',
                    credentialsId: 'github', // replace with your GitHub credentials ID
                    url: 'https://github.com/Munira-23/Django-Ecommerce.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push $DOCKER_IMAGE:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    // Stop & remove old container if it exists
                    sh "docker rm -f django-ecommerce || true"

                    // Run new container from the freshly built image
                    sh "docker run -d --name django-ecommerce -p 8000:8000 $DOCKER_IMAGE:${BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished!"
        }
        failure {
            echo "Something went wrong ❌"
        }
        success {
            echo "Deployment successful ✅"
        }
    }
}
