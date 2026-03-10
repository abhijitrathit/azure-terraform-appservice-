pipeline {
    agent any

    environment {
    ARM_CLIENT_ID       = '86c009a0-3f04-4bde-8a63-100d705f2a4f'
    ARM_CLIENT_SECRET   = '3gE8Q~M6xqmDPt5uMxLsuF7linceW~psGrMtXdmQ'
    ARM_SUBSCRIPTION_ID = '9a402ea6-2da3-434e-be89-731319a89f85'
    ARM_TENANT_ID       = '2ce85261-166c-4a0a-a748-a1644a2e2421'
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
}
