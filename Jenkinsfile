#!/usr/bin/env groovy

node {
  identifier = "Docker Test Service - Master"
  checkout scm
  stage ('Docker build') {
    try {
      image = docker.build('docker-test:master')
      slackSend color: "good", message: "Docker master build succeeded: ${identifier} - ${testvar}"
    }
    catch (exc) {
      slackSend color: "danger", message: "Docker master build failed: ${identifier} - ${testvar}"
    }
  }
  stage ('Docker Test') {
    image.withRun('-p 8085:8085') {c ->
      try {
        sh "nc -z 127.0.0.1 8085"
        slackSend color: "good", message: "Docker master port test succeeded: ${identifier} - ${testvar}"
      }
      catch (exc) {
        slackSend color: "danger", message: "Docker master port test failed: ${identifier} - ${testvar}"
      }
    }
  }
}
