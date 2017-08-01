FROM ubuntu:latest
MAINTAINER Logan "lbarfield@netactuate.com"
RUN apt-get update -y
RUN apt-get install -y python
COPY . /httpserver
WORKDIR /httpserver
RUN sh -c "echo ${TESTONE}"
ENTRYPOINT ["python"]
CMD ["test.py"]
