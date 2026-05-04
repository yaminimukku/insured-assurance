pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yaminimukku/insured-assurance.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                cp target/insured-app.war /mnt/c/Users/chend/Downloads/insured-assurance-app/target/apache-tomcat-9.0.89/webapps/
                '''
            }
        }
    }

    post {
        success {
            withCredentials([string(credentialsId: 'slack-webhook-url', variable: 'SLACK_WEBHOOK')]) {
                sh '''
                curl -X POST -H 'Content-type: application/json' \
                --data '{"text":"✅ Jenkins Build Successful: insured-assurance-deploy"}' \
                $SLACK_WEBHOOK
                '''
            }
        }

        failure {
            withCredentials([string(credentialsId: 'slack-webhook-url', variable: 'SLACK_WEBHOOK')]) {
                sh '''
                curl -X POST -H 'Content-type: application/json' \
                --data '{"text":"❌ Jenkins Build Failed: insured-assurance-deploy"}' \
                $SLACK_WEBHOOK
                '''
            }
        }
    }
}