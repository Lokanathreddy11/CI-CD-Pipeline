pipeline {
    agent any
    Environment {
        AWS_ACCOUNT_ID '353319268982'
        AWS_DEFAULT_REGION 'us-east-1'
        IMAGE_REPO_NAME 'jenkins docker'
        IMAGE_TAG 'V1'
        REPOSITORY_URL '$(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com/$(IMAGE_REPO_NAME)'
    }

    stages {
        stage('Check ECR login status') {
            steps {
                sh 'aws ecr get-login-password --region $(AWS_DEAFULT_REGION) | docker login --username AWS --password-stdin $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com'
            }
        }
    }
    stages {
        stage('Clone repo') {
            steps {
                sh 'init'
                sh 'https://github.com/Lokanathreddy11/CI-CD-Pipeline.git'
            }
        }
    }
    stages {
        stage('Building an image') {
            steps {
                dockerimage . docker,build "$(IMAGE_REPO_NAME):$(IMAGE_TAG)"
            }
        }
    }
    stages {
        stage('Push the image') {
            steps {
                sh 'docker tag $(IMAGE_REPO_NAME):$(IMAGE_TAG) $(REPOSITORY_URL)"$IMAGE_TAG'
                sh 'docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com/$(IMAGE_REPO_NAME):$(IMAGE_TAG)'
            }
        }
    }
}
