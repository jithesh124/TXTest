pipeline {
  agent any
  stages {
    stage('docker_pull') {
      steps {
        sh '''docker login  sys-tx-docker-local.artifactory.swg-devops.com -u txseries@in.ibm.com -p AKCp5btVRcWBkNUiQG4vWivkeWiArec8BQNaZaweHZDHrqhRoXFxKnVC66LMiNhdv61bD4CMA


'''
        sh 'docker pull sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest'
      }
    }
  }
}