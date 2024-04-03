pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/anburani003/capstone.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t anbuvanitha/prod .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    sh 'docker push anbuvanitha/prod'
                }
            }
        }
    }
    
    post {
        
        failure {
            echo 'sending email notification from jenkins'
            
            step([$class: 'Mailer',
      notifyEveryUnstableBuild: true,
      recipients: emailextrecipients([[$class: 'CulpritsRecipientProvider'],
                                      [$class: 'RequesterRecipientProvider']])])

            
       }
    }
}
