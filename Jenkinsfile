pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS = credentials('533267192957')  // Usa el ID de las credenciales en Jenkins
        TF_VAR_region = 'us-east-1'  // Especifica la región de AWS
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/edwarq/testdevops.git'  // Asegúrate de usar la rama 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials-id', region: 'us-east-1']]) {
                        sh 'terraform init'  // Inicializa Terraform
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials-id', region: 'us-east-1']]) {
                        sh 'terraform plan'  // Crea el plan de ejecución de Terraform
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials-id', region: 'us-east-1']]) {
                        sh 'terraform apply -auto-approve'  // Aplica los cambios de Terraform
                    }
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials-id', region: 'us-east-1']]) {
                        sh 'terraform destroy -auto-approve'  // Destruye los recursos creados por Terraform
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
