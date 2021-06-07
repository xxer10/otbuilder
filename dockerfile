FROM jenkins/jenkins:lts

# Running as root to have an easy support for Docker
USER root

# Jenkins init scripts
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/plugins.txt) && \
    mkdir -p /usr/share/jenkins/ref/ && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo lts > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

RUN apt-get update && \
    apt-get install nginx -y

RUN mkdir /var/jenkins_home/jobs/otbuilder

COPY otbuilder /var/jenkins_home/jobs/otbuilder

COPY default /etc/nginx/sites-available/

RUN service nginx reload
