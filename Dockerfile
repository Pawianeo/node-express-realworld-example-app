FROM jenkins/jenkins:lts

USER root

# Instalacja curl + Docker + Node.js + npm + newman + nx
RUN apt-get update && \
    apt-get install -y curl docker.io gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm && \
    npm install -g newman nx

USER jenkins
