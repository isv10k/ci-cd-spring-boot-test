pipeline {
//     agent {
//         docker {
//             image 'maven:3.8.1-adoptopenjdk-11'
//             args '-v /root/.m2:/root/.m2'
//         }
//     }
    agent any
    stages {
        stage('Build') {
            steps {
//                 sh 'mvn -B -DskipTests clean package'
                sh './mvnw clean install'
            }
        }
        stage('Run') {
            steps {
                sh './mvnw spring-boot:run'
            }
        }
    }
}