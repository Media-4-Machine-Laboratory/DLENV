opipeline {
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
          BRANCH_NAME = env.CHANGE_BRANCH ? env.CHANGE_BRANCH : env.BRANCH_NAME
          deleteDir();
          git url: 'https://github.com/${GIT_HOST}/${PRODUCT}.git', branch: BRANCH_NAME
        }
      }
    }
    stage('Build') {
      steps {
        echo "${PRODUCT}"
        sh "docker build . -t ${PRODUCT}:py"
      }
    }
    stage('Test') {
      steps {
        script {
          sh "docker run -it -tty --name ${PRODUCT} ${PRODUCT}:py /usr/bin/make test"
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
