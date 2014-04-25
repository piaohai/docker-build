FROM dockerfile/java
MAINTAINER SequenceIQ

ADD build_project.sh /etc/build_project.sh
RUN chmod +x /etc/build_project.sh

CMD "/etc/build-project.sh"
