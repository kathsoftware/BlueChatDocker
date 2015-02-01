# FROM rouge8/precise-openjdk-7-jdk
FROM jamesdbloom/docker-java7-maven
# Update the cache and our installed packages
RUN apt-get update && apt-get upgrade -y
ENV GRAILS_HOME /local/git/grails-2.4.4
RUN PATH=$GRAILS_HOME/bin:$PATH

# Install application requirements
# Retrieve the code
RUN mkdir /opt/bluechat
RUN git clone https://github.com/kathsoftware/bluechat.git /opt/bluechat
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
# Ready the grails installation
WORKDIR /opt/bluechat
# Expose the grails web-app port
EXPOSE 8080
# Run the application when running the container with no params
ENTRYPOINT ["bash"]
