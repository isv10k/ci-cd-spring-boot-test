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
                sh './mvnw clean install -DskipTests'
            }
        }
        stage('Run') {
            environment {
                JENKINS_NODE_COOKIE = 'dontkill'
            }
            steps {
                sh "pid=\$(lsof -i:8081 -t); [ -z \$pid ] && echo 'spring app was not running' || (kill -TERM \$pid || kill -KILL \$pid)"
                sh 'nohup ./mvnw spring-boot:run &'
            }
        }
    }
}