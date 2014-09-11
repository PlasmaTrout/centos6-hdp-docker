FROM centos:centos6

ADD http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.1/ambari.repo /etc/yum.repos.d/ambari.repo
ADD http://public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.1.5.0/hdp.repo /etc/yum.repos.d/hdp.repo

RUN yum install -y ambari-server tar openssh-server openssh-client

RUN mkdir /opt/java
ADD http://public-repo-1.hortonworks.com/ARTIFACTS/jdk-7u45-linux-x64.tar.gz /opt/java/
RUN cd /opt/java && gunzip jdk-7u45-linux-x64.tar.gz && tar -xvf jdk-7u45-linux-x64.tar

RUN ambari-server setup -v -s -j /opt/java/jdk1.7.0_45

RUN yum install -y ambari-agent

CMD ["ambari-server","start"]
CMD ["ambari-agent","start"]