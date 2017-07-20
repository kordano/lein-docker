FROM ubuntu:latest
MAINTAINER Konrad Kühne konrad.kuehne@protonmail.com

# Update the APT cache
RUN apt-get update

RUN apt-get upgrade -y

# Install and setup project dependencies
RUN apt-get install -y curl git wget unzip zip

# prepare for Java download
RUN apt-get install -y software-properties-common
RUN apt-get -y install openjdk-8-jre-headless
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# fix wget
RUN export HTTP_CLIENT="wget --no-check-certificate -O"

# grab leiningen
RUN wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -O /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein
ENV LEIN_ROOT yes

CMD ["lein"]
