FROM centos:7
CMD echo "bonjour"
RUN yum update -y && yum install -y ant gfortran gcc make git vim curl
RUN pwd
RUN ls -l
RUN adduser compilateur 
WORKDIR /home/compilateur
RUN pwd
RUN git config --global user.name "christophe" 
RUN git config --global user.email "christophe.durville@raisepartner.com"
RUN git config --global core.editor vim
RUN mkdir /home/compilateur/.ssh
COPY identity .ssh/identity
RUN chmod 777 .ssh/identity
RUN ls -l .ssh
RUN  echo "    IdentityFile ~/.ssh/identity" >> /etc/ssh/ssh_config
RUN cat /etc/ssh/ssh_config
RUN git clone git@gitlab.raisepartner.com:quant/norm.git
ENV RPMPATH="/home/norm/release/prod/build/rpm/RPMS/x86_64/"
RUN rm ${RPMPATH}
WORKDIR /home/compilateur/norm/make
RUN make WRErelease-linux OS=linux CRYPTO=non STATUT=release
WORKDIR /home/norm/make/make/installer
RUN ant -f wre-1-packLinux.xml
RUN mv ${RPMPATH}wre-1-4.1-1.el6.x86_64.rpm ${RPMPATH}wre-1-4.1.${BUILD_NUMBER}-nomac-1.el6.x86_64.rpm
