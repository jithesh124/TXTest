pipeline {
  agent none
  stages {
    stage('docker_pull') {
      steps {
        sh '''docker login  sys-tx-docker-local.artifactory.swg-devops.com -u txseries@in.ibm.com -p AKCp5btVRcWBkNUiQG4vWivkeWiArec8BQNaZaweHZDHrqhRoXFxKnVC66LMiNhdv61bD4CMA


'''
        sh 'docker pull sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest'
      }
    }
    stage('docker_run') {
      steps {
        sh 'docker run -p 3271:3270 -p 1436:1435 -p 9443:9443 -it -e LICENSE=accept sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest  '
      }
    }
  }
}