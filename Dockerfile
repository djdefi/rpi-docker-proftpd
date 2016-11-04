FROM djdefi/rpi-alpine

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
apk update && \
apk upgrade && \
apk add shadow bash perl proftpd --no-cache 

COPY launch /launch
COPY proftpd.conf /etc/proftpd.conf
RUN mkdir /ftp

EXPOSE 20 21

ENTRYPOINT /launch
