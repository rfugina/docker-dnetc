
FROM ubuntu:trusty

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y wget
RUN apt-get -y autoremove

RUN mkdir /var/dnetc
RUN chmod 777 /var/dnetc
WORKDIR /var/dnetc

# get software
RUN wget -O - --no-verbose ftp://ftp.distributed.net/dcti/current-client/dnetc-linux-amd64.tar.gz | tar zxvf - --strip-components=1

# import my config
ADD dnetc.ini /var/dnetc/
ADD run_one_block /var/dnetc/

CMD /var/dnetc/dnetc

# run with: docker run -it --name dnetc <tag>
# run in background: docker run -d --name dnetc <tag>

