pipeline {
  agent any

  tools {
    nodejs 'node18'  // to co ustawiłeś w GUI Jenkinsa
  }

  environment {
    DATABASE_URL = 'postgresql://postgres:postgres@host.docker.internal:5432/postgres'
  }

  stages {
    stage('Install dependencies') {
      steps {
        dir('project') {
          sh 'npm install'
          sh 'npx prisma generate'
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

