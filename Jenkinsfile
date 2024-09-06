pipeline {
    agent any
    tools {
      nodejs '22.8.0'
    }
    stages {
        stage('print versions') {
          steps {
            sh 'npm version'
          }
        }
        stage('Install') { 
            steps {
              sh 'npm install'
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build' 
            }
        }
       
        
        
        stage('codedeploy'){
          steps {
            step([$class: 'AWSCodeDeployPublisher', applicationName: 'nodejsCodedeploy', deploymentGroupAppspec: false, deploymentGroupName: 'nodejsCodedeployGroup', excludes: '', iamRoleArn: '', includes: 'dist/', proxyHost: '', proxyPort: 0, region: 'ap-south-1', s3bucket: 'nodejswebapp', s3prefix: '', subdirectory: '', versionFileName: '', waitForCompletion: false])
           }
        }
    }
}