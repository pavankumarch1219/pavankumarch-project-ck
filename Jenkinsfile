pipeline {
  agent any

  environment {
    ARM_CLIENT_ID       = credentials('azure-client-id')
    ARM_CLIENT_SECRET   = credentials('azure-client-secret')
    ARM_TENANT_ID       = credentials('azure-tenant-id')
    ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
  }

  stages {

    stage('Detect Environment') {
      steps {
        script {
          if (env.BRANCH_NAME == 'main') {
            env.ENVIRONMENT = 'prod'
          } else if (env.BRANCH_NAME == 'develop') {
            env.ENVIRONMENT = 'dev'
          } else {
            env.ENVIRONMENT = 'dev'
          }
        }
        echo "Branch: ${env.BRANCH_NAME}"
        echo "Environment: ${env.ENVIRONMENT}"
      }
    }

    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Terraform Init') {
      steps {
        dir("terraform/envs/${ENVIRONMENT}") {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir("terraform/envs/${ENVIRONMENT}") {
          sh "terraform plan -var='build_id=${BUILD_NUMBER}'"
        }
      }
    }

    stage('Terraform Apply (PROD only)') {
      when {
        branch 'main'
      }
      steps {
        input message: 'Approve production deployment?'
        dir("terraform/envs/prod") {
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Maven DateTime App') {
      steps {
        dir("app") {
          sh "mvn clean compile exec:java -P${ENVIRONMENT}"
        }
      }
    }
  }

  post {
    success {
      echo "Pipeline completed successfully"
    }
    failure {
      echo "Pipeline failed"
    }
  }  
}
