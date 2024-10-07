pipeline {
    agent any 

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the Git repository
                git url: 'https://github.com/prane12/Nuhvin-pipeline.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t hello-world-app .'
                }
            }
        }

        stage('Deploy Containers') {
            steps {
                script {
                    // Stop and remove existing containers (if any)
                    sh '''
                    docker stop hello-world-container-1 || true
                    docker rm hello-world-container-1 || true
                    docker stop hello-world-container-2 || true
                    docker rm hello-world-container-2 || true
                    docker stop hello-world-container-3 || true
                    docker rm hello-world-container-3 || true
                    docker stop hello-world-container-4 || true
                    docker rm hello-world-container-4 || true
                    '''

                    // Run new containers
                    sh '''
                    docker run -d --name hello-world-container-1 -p 8081:80 hello-world-app
                    docker run -d --name hello-world-container-2 -p 8082:80 hello-world-app
                    docker run -d --name hello-world-container-3 -p 8083:80 hello-world-app
                    docker run -d --name hello-world-container-4 -p 8084:80 hello-world-app
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}

