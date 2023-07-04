pipeline {
  agent any

  environment {
        PRODUCT = 'ML-Learning'
        GIT_HOST = 'Media-4-Machine-Labortory'
  }

  options {
        skipDefaultCheckout()
        buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage('Checkout') {
      steps {
        script {
          BRANCH_NAME = "main"
          deleteDir();
          git url: "https://github.com/${GIT_HOST}/${PRODUCT}.git", branch: BRANCH_NAME
        }
      }
    }
    stage('Build') {
      steps {
        script {
          sh "docker build -t ml-learning:py ."
        }
      }
    }
    stage('Test') {
      steps {
        script {
          sh "docker run -t --name ${PRODUCT} ml-learning:py"
          sh "docker exec ml-learning:py /bin/sh"
          sh "cat /usr/src/result.txt"
        }
      }
    }
  }

  post {
    always {
      script {
        sh "docker rm ${PRODUCT}"
      }
      deleteDir()
    }
  }
}
