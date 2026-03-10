pipeline {
    agent any

    environment {
        AZURE_SUBSCRIPTION = "9a402ea6-2da3-434e-be89-731319a89f85"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/abhijitrathit/azure-terraform-appservice-.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

    }

    post {
        success {
            echo 'Azure Infrastructure Deployed Successfully'
        }
        failure {
            echo 'Deployment Failed'
        }
    }
}
