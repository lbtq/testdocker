FROM ubuntu:latest
MAINTAINER Logan "lbarfield@netactuate.com"
RUN apt-get update -y
RUN apt-get install -y python
RUN echo "${TESTONE}"
COPY . /httpserver
WORKDIR /httpserver
ENTRYPOINT ["python"]
CMD ["test.py"]
