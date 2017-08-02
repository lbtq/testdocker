FROM ubuntu:latest
MAINTAINER Logan "lbarfield@netactuate.com"

EXPOSE 8085

RUN apt-get update -y
RUN apt-get install -y python
COPY . /httpserver
WORKDIR /httpserver
ENTRYPOINT ["python"]
CMD ["test.py"]
