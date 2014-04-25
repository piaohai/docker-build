FROM dockerfile/java
MAINTAINER SequenceIQ

ADD build-project.sh /etc/build-project.sh
RUN chmod +x /etc/build-project.sh

CMD "/etc/build-project.sh"
