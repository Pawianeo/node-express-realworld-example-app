pipeline {
  agent any

  tools {
    nodejs 'node18'
  }

  environment {
    DATABASE_URL = "postgresql://postgres:postgres@host.docker.internal:5432/postgres"
  }

  stages {
    stage('Install dependencies') {
      steps {
         sh 'npm install || true'          // pozwalamy na błąd przy pierwszym install
      sh 'chmod -R +x node_modules/esbuild'  // dajemy uprawnienia do esbuild
      sh 'npm rebuild esbuild'               // odbudowujemy paczkę
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

