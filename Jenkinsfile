pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your-dockerhub-username/next-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh 'docker login -u your-dockerhub-username -p your-dockerhub-password'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 --name next-app $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline Completed!'
        }
    }
}
