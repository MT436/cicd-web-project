pipeline {
    agent any

     stages {
       stage ('Checkout') {
	      steps{
                 sh 'mvn clean install package'		   
 		   }
	    }
      }
   }
