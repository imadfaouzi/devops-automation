pipeline {
    agent any
    tools {
        maven "maven_3_9_5"
    }

    stages {
        stage('Build Maven') {
            steps {
                // Chekout repo
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/imadfaouzi/devops-automation']])
               bat "mvn clean install"

            }
        }
         stage('Build Docker image') {
              steps {
                  script{
                      bat "docker build -t imadfa01/devops-integration ."
                    }
              }
         }
         stage('Push image to hub') {
              steps {
                  script{
                      withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                              bat "docker login -u imadfa01 -p ${dockerhubpwd}"
                       }
                       bat "docker push imadfa01/devops-integration:latest"
                    }
              }
         }
    }
}