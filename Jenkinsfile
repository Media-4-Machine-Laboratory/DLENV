pipeline {
  agent any

  environment {
        PRODUCT = 'ML-Learning'
        GIT_HOST = 'Media-4-Machine-Labortory'
        MATTERMOST_URL = 'https://a0ec-168-115-40-3.ngrok-free.app/hooks/c33mhc5gz3rsuxkop75r57nxby'
        MATTERMOST_CHANNEL_ID = '4m1nsppmyjgyxbccb8rhesbsuw'
        MATTERMOST_USERID = 'sangkyunjeon'
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
          git url: "https://github.com/${GIT_HOST}/${PRODUCT}.git", branch: BRANCH_NAME, credentialsId: 'm4ml-jenkins-key'
          echo " ----- Completed Checkout Process ----- "
        }
      }
    }
    stage('Build') {
      steps {
        script {
          def output = sh(returnStdout:true, script:"docker build -t ml-learning:py .")
          echo output
          echo " ----- Completed Build Process ----- "
        }
      }
    }
    stage('Test') {
      steps {
        script {
          sh "docker run -t --name ${PRODUCT} ml-learning:py | cat "
          echo " ----- Completed Test Process ----- "
        }
      }
    }
  }

  post {
    always {
      script {
        sh "docker rm ${PRODUCT}"
        sh "docker rmi ml-learning:py"
      }
      deleteDir()
    }
  }
}
