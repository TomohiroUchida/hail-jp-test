FROM docker.io/library/ubuntu:20.04

MAINTAINER "Tomohiro Uchida"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
        python3-pip \
        default-jre \
        wget && \ 
    rm -rf /var/lib/apt/lists/*


RUN \
    pip3 install hail && \
    pip3 install jupyterlab 

RUN ["mkdir", "notebooks"]

RUN wget https://hail.is/docs/0.2/tutorials.tar.gz && \
    tar xf tutorials.tar.gz && \
    mv _build/html/tutorials /notebooks/ && \
    rm tutorials.tar.gz

RUN apt remove -y wget

COPY start-jupyterlab.sh /

EXPOSE 8888

CMD ["/start-jupyterlab.sh"]
