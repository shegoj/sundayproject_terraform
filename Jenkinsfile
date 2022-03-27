pipeline {
    agent any 
    environment  {
                AWS_ACCESS_KEY = credentials ('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = 'eu-west-1'
    }
    stages {
        stage ('terraform code validation for dev or wip') {
        
        when {
            anyOf {
                branch 'wip';
                branch 'dev'
            }
        }
            steps  {
                echo 'about to perform code validation'
                sh 'printenv'
                sh 'terraform init --backend-config="key=development/terraform.tfstate"'
                sh 'terraform validate'
            }
        }
        stage ('terraform code validation for prod') {
        when  {
            branch 'prod'
        }
            steps  {
                echo 'about to perform code validation'
                sh 'printenv'
                sh 'terraform init --backend-config="key=production/terraform.tfstate"'
                sh 'terraform validate'
            }
        }   

        stage ('terraform plan for dev or wip') {
          when {
            anyOf {
                branch 'wip';
                branch 'dev'
            }
        }
            steps {
                sh 'terraform plan -var-file=dev.tfvars'  
                echo 'terraform plan ${BRANCH_NAME}'
            }
        }
    
    stage ('terraform plan for prod') {
          when {
            anyOf {
                branch 'prod';
            }
        }
            steps {
                sh 'terraform plan -var-file=prod.tfvars'  
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