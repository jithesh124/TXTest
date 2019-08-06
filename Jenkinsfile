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
    stage('txRedisBuild') {
      steps {
        git(url: 'https://github.com/jithesh124/TXTest/', branch: 'Dockerfile', credentialsId: 'c8e655f77c4013c4c4e4f4b704950535842170f1')
      }
    }
  }
}