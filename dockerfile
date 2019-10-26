# Base Image
FROM centos:7

LABEL maintainer="John Clarke"

# Update the image to the latest packages
RUN yum update -y

# Install ncat for listener
RUN yum -y install nmap

# Install "ts" for timestamping logs
RUN yum -y install epel-release
RUN yum -y install moreutils

# Expose port 80,3306
EXPOSE 80 3306

# Copy honey_ports script
COPY honey_ports.sh /usr/local/bin/honey_ports.sh

# Make honey_ports executable
RUN chmod +x /usr/local/bin/honey_ports.sh

# Run honey_ports
ENTRYPOINT ["honey_ports.sh"]

