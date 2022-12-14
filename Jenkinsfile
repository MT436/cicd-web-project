pipeline {
    agent any

    triggers {
                  pollSCM '* * * * *'
    }
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
                withSonarQubeEnv('sonar1') {
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
                   deploy adapters: [tomcat9(credentialsId: 'TOMcat', path: '', url: 'http://172.31.1.204:8082/')], contextPath: '/project5', war: '**/*.war'
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
            stage ("Deploy on Docker Tomcat") {
	        steps {
                 sshPublisher(publishers: [sshPublisherDesc(configName: 'docker', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd project5;
                 docker build -t tomcat:v1;
                 docker stop tomcat:v1;
                 docker rm tomcat:v1;
                 docker run -d --name tomcatnew -p 8085:8080 tomcat:v1;
                 ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'project5', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
		    }
			post {
                aborted {
                   // One or more steps need to be included within each condition's block.
                   echo " Docker has been aborted"
                }
                success {
                   // One or more steps need to be included within each condition's block.
                   echo "Docker success"
                }
                failure {
                   // One or more steps need to be included within each condition's block.
                   echo "Docker is faild please check as revert"
                }
            }
	}
      }
           post {
                success {
                   // One or more steps need to be included within each condition's block.
	               emailext body: 'setting up smpt server for mail', recipientProviders: [contributor()], subject: 'check mail', to: 'thejeshmm@gmail.com'

                }
                unsuccessful {
                   // One or more steps need to be included within each condition's block.
                   emailext body: 'setting up smpt server for mail', recipientProviders: [contributor()], subject: 'check mail', to: 'thejeshmm@gmail.com'

                }
           }
 }
 
