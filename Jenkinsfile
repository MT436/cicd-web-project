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
 
      sleep 5
     
      stage ("code quality") {
        steps {
           withSonarQubeEnv('My SonarQube Server') {
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
       

       
  }
 }
