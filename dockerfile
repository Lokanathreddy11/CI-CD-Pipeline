FROM amazonlinux
    
MAINTAINER Your Name Lokanathcode10@gmail.com
WORKDIR /var/lib/jenkins/project1

COPY pom.xml .

RUN yum install update -y


RUN sudo dnf install java-17-amazon-corretto -y 

COPY ..

RUN yum install maven -y
