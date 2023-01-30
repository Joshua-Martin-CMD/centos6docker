FROM --platform=linux/amd64  centos:6.10


RUN sed -i '/^mirrorlist/s/^/#/;/^#baseurl/{s/#//;s/mirror.centos.org\/centos\/6/vault.centos.org\/6.10/}' /etc/yum.repos.d/*B*
RUN sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/fastestmirror.conf

RUN curl https://www.getpagespeed.com/files/centos6-eol.repo --output /etc/yum.repos.d/CentOS-Base.repo
RUN curl https://www.getpagespeed.com/files/centos6-epel-eol.repo --output /etc/yum.repos.d/epel.repo

RUN yum -y install centos-release-scl && \
curl https://www.getpagespeed.com/files/centos6-scl-eol.repo --output /etc/yum.repos.d/CentOS-SCLo-scl.repo && \
curl https://www.getpagespeed.com/files/centos6-scl-rh-eol.repo --output /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo



RUN yum clean all
RUN yum update -y

RUN yum install yum-utils -y
RUN yum-config-manager --enable remi-php74
RUN yum install wget -y

RUN cd /etc/pki/rpm-gpg
RUN wget https://archive.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
#RUN ls -lsa

RUN cd /


RUN yum install php php-cli -y
RUN yum install --nogpgcheck php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json -y

RUN php -v

#EXPOSE 80