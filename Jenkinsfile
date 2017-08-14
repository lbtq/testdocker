#!/usr/bin/env groovy

node {
  identifier = "Docker Test Service - $BRANCH_NAME"
  checkout scm
  stage ('Docker build') {
    try {
      image = docker.build('testdocker:$BRANCH_NAME')
    }
    catch (exc) {
      echo "nope"
    }
  }
  stage ('Docker push') {
    try {
      docker.withRegistry('https://024673053271.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:aws-test') {
        image.push('${BRANCH_NAME}_new')
      }
    } catch (exc) {
      echo "nope"
    }
  }
}
