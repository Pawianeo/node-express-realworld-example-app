pipeline {
    agent any

    environment {
        DATABASE_URL = 'postgresql://postgres:postgres@host.docker.internal:5432/postgres'
    }

    stages {
        stage('Install dependencies') {
            steps {
                dir('project') {
                    sh '''
                        npm install
                        npx prisma generate
                        npx prisma migrate deploy
                    '''
                }
            }
        }

        stage('Run Postman tests') {
            steps {
                dir('project/tests') {
                    sh 'newman run realworld.postman_collection.json'
                }
            }
        }
    }
}
