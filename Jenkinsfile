#!/usr/bin/env groovy

node {
  pull_result = checkout scm
  pull_commit = pull_result['GIT_COMMIT']
  sh "git rev-parse --short ${pull_commit} > git_hash"
  git_hash = readFile 'git_hash'
  sh "rm -f git_hash"
  identifier = "Docker Test Service:$BRANCH_NAME - Commit: ${git_hash}"
  tag = "$BRANCH_NAME_${git_hash}"
  stage ('Docker build') {
    try {
      image = docker.build('testdocker:$tag')
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
