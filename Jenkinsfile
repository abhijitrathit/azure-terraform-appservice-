pipeline {
    agent any

    environment {
        TERRAFORM_REPO_URL = credentials('terraform-repo-url')
        TFVARS_REPO_URL    = credentials('tfvars-repo-url')
        GIT_CREDS          = 'git-creds'
    }

    stages {

        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                credentialsId: "${GIT_CREDS}",
                url: "${TERRAFORM_REPO_URL}"
            }
        }

        stage('Clone tfvars Repo') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${GIT_CREDS}",
                    usernameVariable: 'GIT_USER',
                    passwordVariable: 'GIT_PASS'
                )]) {
                    sh '''
                    rm -rf tfvars-repo
                    git clone https://${GIT_USER}:${GIT_PASS}@${TFVARS_REPO_URL.replace("https://","")} tfvars-repo
                    '''
                }
            }
        }

        stage('Create Separate Workspace') {
            steps {
                sh '''
                mkdir -p deployments/${BUILD_NUMBER}
                cp -r *.tf deployments/${BUILD_NUMBER}/
                cp tfvars-repo/terraform.tfvars deployments/${BUILD_NUMBER}/
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                dir("deployments/${BUILD_NUMBER}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("deployments/${BUILD_NUMBER}") {
                    sh 'terraform plan -var-file=terraform.tfvars'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("deployments/${BUILD_NUMBER}") {
                    sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
                }
            }
        }
    }
}
