pipeline {
  agent {
    label 'docker'
  }

  environment {
        PRODUCT = 'ML-Learning'
        GIT_HOST = 'Media-4-Machine-Labortory'
  }

  options {
        ansiColor('xterm')
        skipDefaultCheckout()
        buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  stages {
    stage('Checkout') {
      steps {
        script {
          BRANCH_NAME = env.CHANGE_BRANCH ? env.CHANGE_BRANCH : env.BRANCH_NAME
          deleteDir();
          git url: 'https://github.com/${env.GIT_HOST}/${env.PRODUCT}.git' branch:BRANCH_NAME
        }
      }
    }
    stage('Build') {
      steps {
        sh "docker build . -t ${env.PRODUCT}:py"
      }
    }
    stage('Test') {
      steps {
        script {
          sh "docker run -it -tty --name ${env.PRODUCT} ${env.PRODUCT}:py /usr/bin/make test"
        }
      }
    }
    
