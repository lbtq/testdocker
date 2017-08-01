FROM ubuntu:latest
MAINTAINER Logan "lbarfield@netactuate.com"
RUN apt-get update -y
RUN apt-get install -y python
COPY . /httpserver
WORKDIR /httpserver
ADD script.sh /httpserver/script.sh
CMD ["./script.sh"]
ENTRYPOINT ["python"]
CMD ["test.py"]
