FROM ubuntu:trusty

LABEL maintainer="Volk  mr.volchonok@gmail.com"

WORKDIR /var/www/site


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jdk && \
    apt-get install -y apache2 && \
    apt-get install -y ntp

RUN mkdir -p web/etc web/www

#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
#ENV PATH="${PATH}:${JAVA_HOME}/bin"

EXPOSE 80

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
