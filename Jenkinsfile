#!/usr/bin/env groovy

node {
  pull_result = checkout scm
  pull_commit = pull_result['GIT_COMMIT']
  sh "git rev-parse --short ${pull_commit} > git_hash"
  git_hash = readFile('git_hash').trim()
  sh "rm -f git_hash"
  identifier = "Docker Test Service:$BRANCH_NAME - Commit: ${git_hash}"
  imagename = "butter-nlp"
  if (env.BRANCH_NAME == "dev") {
    tag = "${BRANCH_NAME}_${git_hash}"
  } else {
    tag = "${BRANCH_NAME}"
  }
  stage ('Docker build') {
    try {
      image = docker.build("testdocker:${tag}")
    }
    catch (exc) {
      echo "nope"
    }
  }
  stage ('Docker push') {
    try {
      docker.withRegistry('https://024673053271.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:aws-test') {
        image.push("${tag}")
      }
    } catch (exc) {
      echo "nope"
    }
  }
  stage('Deploy Dev') {
    if (env.BRANCH_NAME == "dev") {
      dir('K8S_CONFIGS') {
        git branch: 'tmpbranch', credentialsId: '63bb2ae2-08c3-4702-bc61-bf6f04405d2e', url: 'https://github.com/butter/kubernetes.git'
        sh "sed -i -r 's/(image:.*${imagename}:).*\$/\\1${tag}/g\' k8-stage/${imagename}-deployment.yaml"
	sh "kubectl get pods --namespace dev > kube.out"
      }
    }
  }
}
