FROM alpine:2.7
MAINTAINER Daniel Guerra
#meta container, we want fresh builds
ONBUILD RUN apk update
ONBUILD RUN apk add alpine-sdk
ONBUILD RUN addgroup sdk
ONBUILD RUN adduser  -G sdk -s /bin/sh -D sdk
ONBUILD RUN echo "sdk:sdk"| /usr/sbin/chpasswd
ONBUILD RUN echo "sdk    ALL=(ALL) ALL" >> /etc/sudoers
ONBUILD RUN chmod g+w /var/cache/distfiles/
ONBUILD RUN sudo addgroup sdk abuild
ONBUILD USER sdk
ONBUILD WORKDIR /tmp
ONBUILD RUN git clone git://dev.alpinelinux.org/aports
ONBUILD WORKDIR /home/sdk
