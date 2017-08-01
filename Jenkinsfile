#!/usr/bin/env groovy

node {
  identifier = "Docker Test Service - Dev"
  checkout scm
  stage ('Docker build') {
    try {
      image = docker.build('docker-test:dev')
      slackSend color: "good", message: "Docker dev build succeeded: ${identifier}"
    }
    catch (exc) {
      slackSend color: "danger", message: "Docker dev build failed: ${identifier}"
    }
  }
  stage ('Docker Test') {
    image.withRun('-p 8086:8085') {c ->
      try {
        sh "nc -z 127.0.0.1 8086"
        slackSend color: "good", message: "Docker dev port test succeeded: ${identifier}"
      }
      catch (exc) {
        slackSend color: "danger", message: "Docker dev port test failed: ${identifier}"
      }
    }
    image.inside('-p 8086:8085') {c ->
      try {
	sh "echo hi"
      }
      catch (exc) {
	sh "echo hi not defined"
      }
    }
  }
}
