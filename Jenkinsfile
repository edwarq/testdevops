pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS = credentials('533267192957')  // Usa el ID de las credenciales en Jenkins
        TF_VAR_region = 'us-east-1'  // Especifica la región de AWS
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/edwarq/testdevops.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    withCredentials([aws(credentialsId: 'aws-credentials-id', region: 'us-east-1')]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([aws(credentialsId: 'aws-credentials-id', region: 'us-east-1')]) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withCredentials([aws(credentialsId: 'aws-credentials-id', region: 'us-east-1')]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    withCredentials([aws(credentialsId: 'aws-credentials-id', region: 'us-east-1')]) {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Limpiar el workspace de Jenkins
        }
    }
}
