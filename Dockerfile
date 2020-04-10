FROM centos:7
RUN mkdir -p /tmp/turnserver
COPY turnserver-4.5.0.7 /tmp/turnserver
RUN cd /tmp/ && ls
RUN cd /tmp/turnserver && ./install.sh
COPY turnserver.conf /etc/turnserver/turnserver.conf
CMD ["turnserver"]
