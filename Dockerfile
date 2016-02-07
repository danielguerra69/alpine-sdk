FROM alpine:3.2
MAINTAINER Daniel Guerra
#meta container, we want fresh builds
ONBUILD RUN apk update
ONBUILD RUN apk add alpine-sdk
ONBUILD RUN addgroup sdk
ONBUILD RUN adduser -D -G sdk sdk
ONBUILD RUN passwd -d 'sdk' sdk
ONBUILD RUN echo "sdk    ALL=(ALL) ALL" >> /etc/sudoers
ONBUILD RUN chmod g+w /var/cache/distfiles/
ONBUILD RUN sudo addgroup sdk abuild
ONBUILD USER sdk
ONBUILD WORKDIR /home/sdk
ONBUILD RUN abuild-keygen -a -i
ONBUILD RUN git clone git://dev.alpinelinux.org/aports
