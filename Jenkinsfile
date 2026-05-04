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
}