pipeline {
    agent any 
    environment  {
                AWS_ACCESS_KEY = credentials ('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = 'eu-west-1'
    }
    stages {
        stage ('terraform code validation for dev or wip') {
            steps  {
                echo 'about to perform code validation'
                sh 'printenv'
                sh 'terraform init --backend-config="key=${BRANCH_NAME}/terraform.tfstate"'
                sh 'terraform validate'
                sh 'echo ${BRANCH_NAME}'
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