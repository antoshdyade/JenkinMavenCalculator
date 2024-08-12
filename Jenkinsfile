pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Add your build steps here
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t calculator-app:latest .'
                }
            }
        }
        stage('Deploy to Docker') {
            steps {
                script {
                    // Run the Docker container on a different port (8081)
                    sh '''
                        docker stop calculator-app || true
                        docker rm calculator-app || true
                        docker run -d -p 8081:8080 --name calculator-app calculator-app:latest
                    '''
                }
            }
        }
    }
    post {
        always {
            junit 'target/surefire-reports/*.xml'
            echo 'Build, Test, or Deployment Failed.'
        }
    }
}
