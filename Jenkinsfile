#!/usr/bin/env groovy

node {
  identifier = "Docker Test Service"
  checkout scm
  stage ('Docker build') {
    try {
      image = docker.build('docker-test:latest')
      slackSend color: "good", message: "Docker build succeeded: ${identifier}"
    }
    catch (exc) {
      slackSend color: "danger", message: "Docker build failed: ${identifier}"
    }
  }
  stage ('Docker Test') {
    image.withRun('-p 8085:8085') {c ->
      try {
        sh "nc -z 127.0.0.1 8085"
        slackSend color: "good", message: "Docker port test succeeded: ${identifier}"
      }
      catch (exc) {
        slackSend color: "danger", message: "Docker port test failed: ${identifier}"
      }
    }
  }
}
