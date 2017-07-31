FROM ubuntu:latest
MAINTAINER Logan "lbarfield@netactuate.com"
RUN apt-get update -y
COPY . /httpserver
WORKDIR /httpserver
ENTRYPOINT ["python"]
CMD ["test.py"]
