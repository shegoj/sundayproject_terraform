pipeline {
    agent any 
    environment  {
                AWS_ACCESS_KEY = credentials ('AWS_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = 'eu-west-1'
    }
    stages {
        stage ('terraform code validation') {
  
            steps  {
                echo 'about to perform code validation'
                sh 'printenv'
                sh 'terraform init --backend-config="key=development/terraform.tfstate"'
                sh 'terraform validate'
            }
        }
        
        stage ('terraform plan') {
            steps {
                sh 'terraform plan -var-file=dev.tfvars'  
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