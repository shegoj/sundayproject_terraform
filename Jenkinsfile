pipeline {
    agent any 
    environment  {
                AWS_ACCESS_KEY = credentials ('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = 'eu-west-1'
                CURRENT_BRANCH = "${env.BRANCH_NAME == "wip" ? "dev" : env.BRANCH_NAME}"
    }
    stages {
        stage ('terraform code validation for dev or wip') {
            steps  {
                sh 'echo ${CURRENT_BRANCH}'
            }
        }
    }
    
    post {
        always  {
            echo ' i just ran a pipleine'
            deleteDir()
        }
    }
}