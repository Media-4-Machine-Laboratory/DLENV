pipeline {
  agent any

  environment {
        PRODUCT = 'ML-Learning'
        GIT_HOST = 'Media-4-Machine-Labortory'
        MATTERMOST_URL = 'https://a0ec-168-115-40-3.ngrok-free.app/hooks/c33mhc5gz3rsuxkop75r57nxby'
        MATTERMOST_CHANNEL = 'Jenkins CI/CD'
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
          sh "docker build -t ml-learning:py ."
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
        sh "REQUEST=\'curl -i \
            -X POST \
            -d \'{ \
                \"channel\": \"${CHANNEL}\", \
                \"icon_url\": \"https://www.mattermost.org/wp-content/uploads/2016/04/icon.png\", \
                \"attachments\": [{ \
                        \"fallback\": \"Nouvelle construction Jenkins\", \
                        \"color\": \"#FF8000\", \
                        \"text\": \"Informations sur la construction :\", \
                        \"author_name\": \"Jenkins\", \
                        \"author_icon\": \"https://myjenkins .com/url/vers/photo/jenkins.png\", \
                        \"author_link\": \"https://myjenkins.com/\", \
                        \"title\": \"Nouvelle version déployée\", \
                        \"title_link\": \"$BUILD_URL\", \
                        \"fields\": [{ \
                                  \"short\":true, \
                                  \"title\":\"Branche\", \
                                  \"value\":\"$_BRANCH_NAME\" \
                        }, \
                        { \
                                  \"short\":true, \
                                  \"title\":\"Version\", \
                                  \"value\":\"$_PROJECT_VERSION\" \
                        }, \
                        { \
                                \"short\":false, \
                                \"title\":\"Détails\", \
                                \"value\":\"$BUILD_URL\" \
                        }] \
        }] \
        }'\
        ${MATTERMOST_URL}"
      }
      deleteDir()
    }
  }
}
