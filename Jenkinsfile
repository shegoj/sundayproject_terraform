pipeline {
    agent any 
    environment  {
                AWS_ACCESS_KEY = credentials ('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = 'eu-west-1'
                CURRENT_BRANCH = "${env.BRANCH_NAME == "wip" ? "dev" : env.BRANCH_NAME}"
    }
    stages {
        stage ('terraform validate') {
            steps  {
                echo 'about to perform code validation'
                sh 'terraform init --backend-config="key=${CURRENT_BRANCH}/terraform.tfstate"'
                sh 'terraform validate'
            }
        }
        stage ('terraform plan') {
            steps  {
                echo 'about to perform terraform plan'
                sh 'terraform plan -var-file=${CURRENT_BRANCH}.tfvars'
            }
        }
        stage ('terraform apply') {
            when {
                anyOf {
                    branch 'prod';
                    branch 'dev'
                }
            }
            steps  {
                echo 'about to perform terraform apply....'
                sh 'terraform apply -var-file=${CURRENT_BRANCH}.tfvars -auto-approve'
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