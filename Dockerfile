FROM alpine:3.7

ENV REPODIR=/srv/repos

RUN apk --no-cache add openssh-server
RUN apk --no-cache add git

EXPOSE 22/tcp

COPY config/** /etc/

RUN ssh-keygen -A # generate ssh host keys of all types
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
