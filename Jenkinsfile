pipeline {
    agent any

    stages {
        stage ('Build') {
            steps{
                   sh 'mvn clean install package'
                   }
            post {
                aborted {
                   // One or more steps need to be included within each condition's block.
                   echo " Build has been aborted"
                }
                success {
                   // One or more steps need to be included within each condition's block.
                   echo "Build is success processiding to quality check"
                }
                failure {
                   // One or more steps need to be included within each condition's block.
                   echo "Build is faild please check as revert"
                }
            }
        }


        stage ("code quality") {
            steps {
                withSonarQubeEnv('sonar') {
                    sh 'mvn sonar:sonar'
                }
            }
            post {
                aborted {
                   // One or more steps need to be included within each condition's block.
                   echo " quality has been aborted"
                }
                success {
                   // One or more steps need to be included within each condition's block.
                   echo "success quality check"
                }
                failure {
                   // One or more steps need to be included within each condition's block.
                   echo "quality is faild please check as revert"
                }
            }
        }
		
	    stage ("Deploy on Tomcat") {
	        steps {
                   deploy adapters: [tomcat9(credentialsId: 'TOMcat', path: '', url: 'http://172.31.35.76:8082/')], contextPath: 'project4', war: 'pipeline-decl-1/target/hello-world.war'
                }
		post {
                aborted {
                   // One or more steps need to be included within each condition's block.
                   echo " Deploy has been aborted"
                }
                success {
                   // One or more steps need to be included within each condition's block.
                   echo "Deploy success"
                }
                failure {
                   // One or more steps need to be included within each condition's block.
                   echo "Deploy is faild please check as revert"
                }
            }
	    }
    }
 }

