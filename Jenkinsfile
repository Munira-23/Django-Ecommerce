pipeline {
    agent any

    options {
        skipDefaultCheckout() // prevents Jenkins from auto-checkout
    }

    environment {
        DOCKER_IMAGE = "munira123/django-ecommerce"
    }

    stages {
        stage('Checkout') {
            steps {
                cleanWs() // wipe any leftover workspace
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/develop']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Munira-23/Django-Ecommerce.git',
                        credentialsId: 'github'
                    ]]
                ])
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE:${BUILD_NUMBER} ."
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
                sh "docker push $DOCKER_IMAGE:${BUILD_NUMBER}"
            }
        }

        stage('Deploy Container') {
            steps {
                sh "docker rm -f django-ecommerce || true"
                sh "docker run -d --name django-ecommerce -p 8000:8000 $DOCKER_IMAGE:${BUILD_NUMBER}"
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
