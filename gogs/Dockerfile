FROM alpine:3.8
#
## Example dockerfile serving N services using an init system

# install ssh server
RUN apk update && apk upgrade
RUN apk add openssh openrc
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN wget https://github.com/nihr43.keys -O /root/.ssh/authorized_keys
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
RUN rc-update add sshd
EXPOSE 22

# install gogs
RUN apk add gogs
RUN sed -i '/need net/d' /etc/init.d/gogs
RUN sed -i '/after firewall/d' /etc/init.d/gogs
RUN rc-update add gogs
EXPOSE 3000

ENTRYPOINT /sbin/openrc-init
