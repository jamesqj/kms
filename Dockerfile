# This for mono-opt under ubuntu 14.04.2 
FROM ubuntu
RUN apt-get update
RUN apt-get install -y --force-yes openssh-server zip
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN wget http://www.dwhd.org/wp-content/uploads/2015/07/vlmcsd-svn812-2015-08-30-Hotbird64.zip
#http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms
RUN unzip -q vlmcsd-svn812-2015-08-30-Hotbird64.zip -d /usr/local/
RUN ln -sv /usr/local/vlmcsd-svn812-2015-08-30-Hotbird64/ /usr/local/KMS
RUN echo "export PATH=/usr/local/KMS/binaries/Linux/intel/static:\$PATH" > /etc/profile.d/vlmcs.sh
RUN source /etc/profile.d/vlmcs.sh
RUN chmod +x /usr/local/KMS/binaries/Linux/intel/static/*
RUN echo "vlmcsd-x64-musl-static" >> /etc/rc.local
EXPOSE 22 1688
RUN vlmcsd-x64-musl-static
