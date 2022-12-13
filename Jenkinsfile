pipeline {
    agent any

     Stages {
       Stage ('Checkout') {
	      Steps{
                 sh 'mvn clean install package'		   
 		   }
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
   }
