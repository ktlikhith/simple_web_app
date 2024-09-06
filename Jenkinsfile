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
        stage('Zip Artifacts') {
            steps {
                
                sh '''
                if ! command -v zip &> /dev/null
                then
                    echo "zip could not be found, installing..."
                    sudo apt-get update && sudo apt-get install -y zip
                fi
                '''
               
                sh "zip -r ${GIT_COMMIT}.zip dist/"
            }
        }

        stage ('upload to s3'){
            steps{
                sh 'aws s3 cp $GIT_COMMIT.zip '
            }
        }
        // stage('codedeploy'){
        //   steps {
        //     step([$class: 'AWSCodeDeployPublisher', applicationName: 'nodejs-application', deploymentGroupAppspec: false, deploymentGroupName: 'nodejs-application-DG', excludes: '', iamRoleArn: '', includes: 'dist/', proxyHost: '', proxyPort: 0, region: 'ap-south-1', s3bucket: 'deploymasters-nodejs', s3prefix: '', subdirectory: '', versionFileName: '', waitForCompletion: false])
        //    }
        // }
    }
}