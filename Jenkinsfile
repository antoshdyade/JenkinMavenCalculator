pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Clean and build the project using Maven
                    sh 'mvn clean package'
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Run tests using Maven
                    sh 'mvn test'
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image for the application
                    sh 'docker build -t calculator-app:latest .'
                }
            }
        }
        
        stage('Deploy to Docker') {
            steps {
                script {
                    // Stop and remove the existing container if running
                    sh '''
                        if [ "$(docker ps -q -f name=calculator-app)" ]; then
                            docker stop calculator-app
                            docker rm calculator-app
                        fi
                    '''
                    
                    // Run the Docker container with the new image
                    sh 'docker run -d -p 8081:8080 --name calculator-app calculator-app:latest'
                }
            }
        }
    }
    
    post {
        always {
            junit '**/target/surefire-reports/*.xml'
            echo 'Build, Test, or Deployment Finished.'
        }
        
        failure {
            echo 'Build, Test, or Deployment Failed.'
        }
    }
}
