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
    image.withRun('-p 8086:8085 --name="test" -e ENV=development -e LOG_LEVEL=DEBUG -e DATASTORE_SERVICE_HOST=192.168.1.1 -e DATASTORE_SERVICE_PORT=1234 -e POSTGRES_DBNAME=test -e POSTGRES_USER=testadmin -e POSTGRES_PASSWORD=testpassword -e REDIS_SERVICE_HOST=172.16.1.9 -e REDIS_SERVICE_PORT=6379 -e REDIS_DB=0 -e MONGO_SERVICE_HOST=172.16.1.7 -e MONGO_SERVICE_PORT=27017 -e MONGO_DB_DOCSTORE=storeohone -e MONGO_DB_FLUFFER=fluffer -e MONGO_COLLECTION_DOCSTORE_DOCS=docs -e MONGO_COLLECTION_VAULT_MESSAGES=messages -e MONGO_COLLECTION_FLUFFER_SOLRCONFIG=solr_config -e SOLR_SERVICE_HOST=172.16.1.5 -e SOLR_SERVICE_PORT=8983 -e SOLR_DEFAULT_COLLECTION=storeohone -e RABBITMQ_SERVICE_HOST=172.16.1.3 -e RABBITMQ_SERVICE_PORT_NODE=5678 -e RABBITMQ_SERVICE_PORT_MANAGEMENT=2345 -e RABBITMQ_USER=fluffer-production -e RABBITMQ_PASS=OLMngasin3 -e RABBITMQ_VIRTUAL_HOST= -e POTS_SERVICE_HOST=172.16.1.2 -e POTS_SERVICE_PORT=5001 -e FLAFFER_NLP_SERVICE_HOST=172.16.1.1 -e FLAFFER_NLP_SERVICE_PORT=5000 -e NLP_SERVICE=my-name -e WIT_BASE_URL=https://api.woot.ai/ -e WIT_ACCESS_TOKEN=NAOSDFOSDFMAODMS -e SEGMENT_WRITE_KEY=AbCdEfG1234 -e GITHUB_USERNAME=test -e GITHUB_ACCESS_TOKEN=${testvar}') {c ->
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
