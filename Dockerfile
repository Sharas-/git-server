FROM alpine:3.7

ENV REPODIR=/srv/repos

RUN apk --no-cache add openssh-server
RUN apk --no-cache add git

EXPOSE 22/tcp

RUN adduser git -h $REPODIR -s /bin/ash -D && echo "git:admin" | chpasswd
USER git
VOLUME $REPODIR

USER root
RUN ssh-keygen -A # generate ssh host keys of all types
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
