pipeline {
    agent any

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
                    sh 'docker build -t django-ecommerce .'
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    // Stop and remove container if it exists
                    sh 'docker rm -f django-ecommerce-app || true'
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 --name django-ecommerce-app django-ecommerce'
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
