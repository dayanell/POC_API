pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository using the same URL and credentials as in the Freestyle job
                git credentialsId: 'git_id', url: 'https://github.com/dayanell/POC_API.git', branch: 'main'
            }
        }

        stage('Run Newman Tests') {
            steps {
                // Run Newman command using the environment files from the repository
                sh '''
                    newman run "Test Automation - POC.postman_collection.json" \
                    -e "QA.postman_environment.json" \
                    -d "data.json" \
                    -r htmlextra --reporter-htmlextra-export newman/html-report.html
                '''
            }
        }
    }

    post {
        always {
            // Archive the HTML report
            archiveArtifacts artifacts: 'newman/html-report.html', allowEmptyArchive: true

            // Publish the HTML report
            publishHTML(target: [
                reportDir: 'newman',
                reportFiles: 'html-report.html',
                reportName: 'Newman HTML Report',
                keepAll: true
            ])
        }
    }
}
