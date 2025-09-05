pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    credentialsId: 'your-github-credentials-id',
                    url: 'https://github.com/your-username/django-ecommerce.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t django-ecommerce .'
                }
            }
        }

        stage('Run Container') {
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
