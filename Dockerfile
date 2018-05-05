FROM alpine:3.5
MAINTAINER Daniel Guerra
#meta container, we want fresh builds
RUN apk update
RUN apk add alpine-sdk
RUN addgroup sdk
RUN adduser  -G sdk -s /bin/sh -D sdk
RUN echo "sdk:sdk"| /usr/sbin/chpasswd
RUN echo "sdk    ALL=(ALL) ALL" >> /etc/sudoers
RUN chmod g+w /var/cache/distfiles/
RUN sudo addgroup sdk abuild
USER sdk
WORKDIR /tmp
RUN git clone --branch 3.5-stable --recursive https://github.com/alpinelinux/aports.git
WORKDIR /home/sdk
