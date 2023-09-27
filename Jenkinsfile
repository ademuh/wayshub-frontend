def dir = "~/wayshub-frontend"
def cred = "appserver"
def server = "aimingds@103.127.97.24"

pipeline{
	agent any
	stages{
		stage("docker compose down & pulling repo"){
			steps{
				sshagent([cred]){
				sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
				cd ~
				docker compose down
				cd ${dir}
				git pull origin main
				exit
				EOF"""
				}
			}
		}
		stage("building docker image"){
                        steps{
                                sshagent([cred]){
                                sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
				cd ${dir}
				docker build -t wayshub-fe .
                                EOF"""
                                }
                        }
                }
		stage("docker compose up"){
                        steps{
                                sshagent([cred]){
                                sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
				cd ~
				docker compose up -d
                                EOF"""
                                }
                        }
                }
	}
}
