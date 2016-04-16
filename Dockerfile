# This for mono-opt under ubuntu 14.04.2 
FROM ubuntu
RUN apt-get update
RUN apt-get install -y --force-yes openssh-server wget
wget http://www.dwhd.org/wp-content/uploads/2015/07/vlmcsd-svn812-2015-08-30-Hotbird64.zip
#http://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms
unzip -q vlmcsd-svn812-2015-08-30-Hotbird64.zip -d /usr/local/
ln -sv /usr/local/vlmcsd-svn812-2015-08-30-Hotbird64/ /usr/local/KMS
echo "export PATH=/usr/local/KMS/binaries/Linux/intel/static:\$PATH" > /etc/profile.d/vlmcs.sh
source /etc/profile.d/vlmcs.sh
chmod +x /usr/local/KMS/binaries/Linux/intel/static/*
echo "vlmcsd-x64-musl-static" >> /etc/rc.local
EXPOSE 22  8081  80 1688
vlmcsd-x64-musl-static
