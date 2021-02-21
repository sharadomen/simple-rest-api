#!/usr/bin/groovy
pipeline {
    agent any

    tools {
        nodejs 'node'
    }

    environment {
    //Global Lang Locale
    LANG = 'en_US.UTF-8'
	LC_ALL = "$LANG"
  
    //Global Tool Variable
	PATH = "/root/.nvm:$HOME/.nvm/versions/node/v10.23.1/bin:$PATH"

    //Extra Variables
    FILE_NAME = 'simple-rest-api'
    REPO_USER = "sharadomen/${FILE_NAME}"
    VERSION = "${BUILD_ID}"
    DOCKER_EXTRA_VARS = '--no-cache'

    //Git Checkout
    GIT_URL = 'https://github.com/sharadomen'
    FS_GIT = "$GIT_URL/simple-rest-api.git"
    }

    options {
    ansiColor('xterm')
    buildDiscarder(logRotator(daysToKeepStr: '5', numToKeepStr: '100'))
    }

    stages {
    stage('Checkout Code: Pull') {
        steps {
            git branch: 'main',
                        credentialsId: 'gitscm',
                        url: "$FS_GIT"
        }
    }

    stage('Node Build and Test') {
        steps {
            sh '''
            npm install
            npm test
            '''
        }
    }

    stage('Docker Build') {
        steps {
            sh '''
            tar --exclude='Dockerfile'  --exclude='run.sh' --exclude='.git*' -zcf ${FILE_NAME}.tar . >/dev/null 2>&1
            docker build . -t ${REPO_USER}:${VERSION} ${DOCKER_EXTRA_VARS}
            '''
        }
    }

    stage('Docker Push') {
        steps{
            sh '''
            docker push ${REPO_USER}:${VERSION}
            '''
        }
    }
    }
}