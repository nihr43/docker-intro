## Building a docker service


#### Create a Dockerfile

```
FROM alpine:3.8
#
## dockerfile built to boot on sshd, and listen for root

RUN apk update && apk upgrade

# install ssh server
RUN apk add openssh
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN wget https://github.com/nihr43.keys -O /root/.ssh/authorized_keys
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
```

#### Build the image
```
docker build -t "sshd:sshd" .
```

#### Run a new instance of the images
```
docker run -d adba09647b57
docker container list
```

#### If it won't start, run it in the foreground:
```
docker run -it adba09647b57
```

#### enter a container
```
docker exec -it 5f4477c36969 sh
```

#### stop a container
```
docker container stop 5f4477c36969
```
