FROM centos:7
RUN yum update -y && yum install -y zip ant gcc make git vim curl gcc-gfortran openssl-devel 
VOLUME /home/compilateur/norm
WORKDIR /home/compilateur/norm
