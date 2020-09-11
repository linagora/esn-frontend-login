pipeline {
  agent none

  stages {
    stage('Install packages & Lint') {
      agent {
        docker {
          image 'node:10-buster'
        }
      }

      steps {
        sh 'npm install'
        sh 'npm run lint'
      }
    }

    stage('Deliver Docker images') {
      when { branch 'main' }
      agent {
        docker {
          image 'docker:19.03.12-dind'
          args '-e DOCKER_HOST=$DOCKER_HOST'
        }
      }

      steps {
        script {
          def dockerImage = docker.build 'linagora/esn-frontend-login'
          docker.withRegistry('', 'dockerHub') {
            dockerImage.push('branch-main')
          }
        }
      }
    }

    stage('Deploy new version') {
      when { branch 'main' }
      steps {
        echo "Deploy"
      }
    }
  }
}
