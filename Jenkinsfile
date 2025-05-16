pipeline {
  agent any

  tools {
    nodejs 'node18' // Nazwa jaką ustawiłeś w Jenkins > Global Tool Configuration
  }

  environment {
    DATABASE_URL = 'postgresql://postgres:postgres@host.docker.internal:5432/postgres'
  }

  stages {
    stage('Install dependencies') {
      steps {
        dir('project') {
          sh 'npm install || true'
        }
      }
    }

    stage('Generate Prisma Client') {
      steps {
        dir('project') {
          sh 'npx prisma generate || true'
        }
      }
    }

    stage('Run Postman tests') {
      steps {
        dir('tests') {
          sh 'newman run realworld.postman_collection.json'
        }
      }
    }
  }
}

