## Building a docker service


#### Create a Dockerfile

```
FROM debian:buster

RUN apt update && apt install -y wget openrc openssh-server

#RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN wget https://github.com/nihr43.keys -O /root/.ssh/authorized_keys
EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
RUN rc-update add ssh 


RUN apt install nginx -y
RUN rc-update add nginx

CMD ["nginx", "-g", "daemon off;"]
```

#### Build the file

```
docker build -t "sshd:sshd" .
```

Run a new instance of the image
```
docker run -d adba09647b57
docker container list
```

If it won't start, run it in the foreground:
```
docker run -it adba09647b57
```

stop a container
```
docker container stop 5f4477c36969
```
