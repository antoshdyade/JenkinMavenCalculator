pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "calculator-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Compile the code
                sh 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                // Run unit tests
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                // Package the application as a WAR file
                sh 'mvn package'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    // Run the Docker container
                    sh 'docker run -d -p 8080:8080 --name calculator-app ' + DOCKER_IMAGE
                }
            }
        }
    }

    post {
        always {
            // Publish JUnit test results
            junit '**/target/surefire-reports/*.xml'
        }
        success {
            echo 'Build, Test, and Deployment Successful!'
        }
        failure {
            echo 'Build, Test, or Deployment Failed.'
        }
    }
}

