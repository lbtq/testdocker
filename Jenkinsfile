#!/usr/bin/env groovy

node {
  pull_result = checkout scm
  pull_commit = pull_result['GIT_COMMIT']
  git_hash = sh 'git rev-parse --short ${pull_commit}'
  identifier = "Docker Test Service:$BRANCH_NAME - Commit: ${git_hash}"
  tag = ${BRANCH_NAME}_${git_hash}
  stage ('Docker build') {
    try {
      image = docker.build('testdocker:${tag}')
    }
    catch (exc) {
      echo "nope"
    }
  }
  stage ('Docker push') {
    try {
      docker.withRegistry('https://024673053271.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:aws-test') {
        image.push('${tag}')
      }
    } catch (exc) {
      echo "nope"
    }
  }
}
