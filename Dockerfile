FROM centos:7
CMD echo "bonjour"
# RUN yum update -y && yum install -y ant gfortran gcc make git
RUN pwd
RUN ls -l
