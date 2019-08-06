pipeline {
  agent any
  stages {
    stage('docker_pull') {
      parallel {
        stage('docker_pull') {
          steps {
            sh '''docker login  sys-tx-docker-local.artifactory.swg-devops.com -u txseries@in.ibm.com -p AKCp5btVRcWBkNUiQG4vWivkeWiArec8BQNaZaweHZDHrqhRoXFxKnVC66LMiNhdv61bD4CMA


'''
            sh 'docker pull sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest'
          }
        }
        stage('docker_stop_cics_tx_cnt') {
          steps {
            sh 'docker stop $(docker ps | grep sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest | awk \'{print $1}\')'
          }
        }
        stage('docker_stop_redis_serv') {
          steps {
            sh 'docker stop $(docker ps | grep redisserv  | awk \'{print $1}\')'
          }
        }
      }
    }
    stage('docker_run') {
      parallel {
        stage('docker_run') {
          steps {
            sh 'docker run -p 3271:3270 -p 1436:1435 -p 9443:9443 -t -e LICENSE=accept sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest &  '
          }
        }
        stage('redis_server') {
          steps {
            sh 'docker run --name redisserv -d redis'
          }
        }
      }
    }
    stage('docker_rediscli_build') {
      steps {
        sh '''docker build -t ibm-cics-tx-on-cloud/rediscli 

--build-arg vip_redis_client_version=0.3.0   --build-arg redis_client_version=0.13.3 --build-arg redis_serv_addr=172.17.0.5 --build-arg redis_serv_port=6379 --build-arg redis_serv_type=REDIS /Users/jithesh/jithesh_work/cloud_work/redisDockerFile  '''
      }
    }
  }
}