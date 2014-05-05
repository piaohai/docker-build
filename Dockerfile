FROM dockerfile/java
MAINTAINER SequenceIQ

ADD build-project.sh /etc/build-project.sh
RUN chmod +x /etc/build-project.sh

RUN wget http://apt.typesafe.com/repo-deb-build-0002.deb
RUN dpkg -i repo-deb-build-0002.deb
RUN rm -f repo-deb-build-0002.deb

RUN apt-get install -y scala

CMD "/etc/build-project.sh"
