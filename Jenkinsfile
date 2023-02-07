def cred = 'appserver'
def server = 'ads@103.30.195.56'
def dir = '~/wayshub-frontend'
def branch = 'main'
//def image = 'aimingds/wayshub-be:latest'

pipeline{
    agent any
    stages{
        stage('docker-compose down & pull repository'){
            steps{
                sshagent([cred]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${dir}
                    docker-compose down
                    git pull origin ${branch}
                    exit
                    EOF"""
                    }
                }
            }
        stage('Starting app'){
            steps{
                sshagent([cred]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${dir}
                    docker-compose up -d
                    exit
                    EOF"""
                    }
                }
            }
        }
    }
}
