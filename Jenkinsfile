pipeline {
    agent any

    parameters {
        string(
            name: 'TFVARS_REPO_URL',
            defaultValue: '',
            description: 'Enter Git repository URL containing terraform.tfvars'
        )
    }

    environment {
        AZURE_CREDENTIALS = 'jenkins-vm-manager'
    }

    stages {

        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/abhijitrathit/azure-terraform-appservice-.git'
            }
        }

        stage('Azure Login') {
            steps {
                withCredentials([azureServicePrincipal('jenkins-vm-manager')]) {
                    sh '''
                    az login --service-principal \
                      -u $AZURE_CLIENT_ID \
                      -p $AZURE_CLIENT_SECRET \
                      --tenant $AZURE_TENANT_ID
                    '''
                }
            }
        }

        stage('Clone tfvars Repo') {
            steps {
                sh '''
                rm -rf tfvars-repo
                git clone ${TFVARS_REPO_URL} tfvars-repo
                '''
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

        stage('Approval Before Apply') {
            steps {
                input message: "Approve Terraform Apply?"
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
