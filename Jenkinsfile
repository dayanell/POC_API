pipeline {
  agent {
    docker {
      image 'node:14' // Use an official Node.js Docker image with npm included
      args '-u root:root' // Run as root to install global packages
    }
  }

  environment {
    POSTMAN_API_KEY = credentials('postman-api-key')
  }

  stages {
    stage('Install Newman') {
      steps {
        sh 'npm install -g newman'
      }
    }
    stage('Postman CLI Login') {
      steps {
        sh 'newman login --with-api-key $POSTMAN_API_KEY'
      }
    }

    stage('Running collection') {
      steps {
        sh 'newman run "20760720-087afede-f151-4b9e-9d23-fdc8dcef148b" -e "20760720-0526353d-9fcf-4308-82a3-222b62d43494"'
      }
    }
  }
}
