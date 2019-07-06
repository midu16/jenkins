#!/bin/bash
################################################################################
#
# Mihai IDU - 2019
#
# Description :
################################################################################
# Setting the environment variables to be used later in the script
set -e
################################################################################
# Defining the environment variables
################################################################################
# Performed an first update
YUM_SYSTEM_UPDATE="update"
YUM_PACKAGE_NAME="java-1.8.0-openjdk java-1.8.0-openjdk-devel"
# Performed an first update
DEB_SYSTEM_UPDATE="update"
DEB_PACKAGE_NAME="openjdk-8-jdk openjdk-8-jre"
# Perform the jenkins set of commands to install it RHEL/CentOS
YUM_JENKINS_KEY="sudo curl -o /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo"
YUM_JENKINS_KEY_IMPORT="sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key"
YUM_JENKINS_INSTALL="jenkins"
# Perform the jeniins set of commands to install it Debian
DEB_JENKINS_KEY="wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -"
DEB_JENKINS_KEY_IMPORT="sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'"
DEB_JENKINS_INSTALL="jenkins"
# Defining the generic environment variable
PACKAGE="jenkins"
################################################################################
# Defining different causes to be used based on the type of the OS

 if cat /etc/*release | grep ^NAME | grep CentOS; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on CentOS"
    echo "==============================================="
    #Perform the first update on the OS
    yum install -y $YUM_SYSTEM_UPDATE
    #Perform the java installation
    yum install -y $YUM_PACKAGE_NAME
    #Perform the jenkins installation
    $YUM_JENKINS_KEY
    $YUM_JENKINS_KEY_IMPORT
    yum install -y $YUM_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Red; then
    echo "==============================================="
    echo "Installing packages $YUM_PACKAGE_NAME on RedHat"
    echo "==============================================="
    #Perform the first update on the OS
    yum install -y $YUM_SYSTEM_UPDATE
    #Perform the java installation
    yum install -y $YUM_PACKAGE_NAME
    #Perform the jenkins installation
    $YUM_JENKINS_KEY
    $YUM_JENKINS_KEY_IMPORT
    yum install -y $YUM_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Fedora; then
    echo "================================================"
    echo "Installing packages $YUM_PACKAGE_NAME on Fedorea"
    echo "================================================"
    #Perform the first update on the OS
    yum install -y $YUM_SYSTEM_UPDATE
    #Perform the java installation
    yum install -y $YUM_PACKAGE_NAME
    #Perform the jenkins installation
    $YUM_JENKINS_KEY
    $YUM_JENKINS_KEY_IMPORT
    yum install -y $YUM_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Ubuntu"
    echo "==============================================="
    #Perform the first update on the OS
    apt-get update
    #Perform the java installation
    apt-get install -y $DEB_PACKAGE_NAME
    #Perform the jenkins installation
    $DEB_JENKINS_KEY
    $DEB_JENKINS_KEY_IMPORT
    apt-get install -y $DEB_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Debian ; then
    echo "==============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Debian"
    echo "==============================================="
    #Perform the first update on the OS
    apt-get update
    #Perform the java installation
    apt-get install -y $DEB_PACKAGE_NAME
    #Perform the jenkins installation
    $DEB_JENKINS_KEY
    $DEB_JENKINS_KEY_IMPORT
    apt-get install -y $DEB_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Mint ; then
    echo "============================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Mint"
    echo "============================================="
    #Perform the first update on the OS
    apt-get update
    #Perform the java installation
    apt-get install -y $DEB_PACKAGE_NAME
    #Perform the jenkins installation
    $DEB_JENKINS_KEY
    $DEB_JENKINS_KEY_IMPORT
    apt-get install -y $DEB_JENKINS_INSTALL

 elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
    echo "================================================="
    echo "Installing packages $DEB_PACKAGE_NAME on Kanoppix"
    echo "================================================="
    #Perform the first update on the OS
    apt-get update
    #Perform the java installation
    apt-get install -y $DEB_PACKAGE_NAME
    #Perform the jenkins installation
    $DEB_JENKINS_KEY
    $DEB_JENKINS_KEY_IMPORT
    apt-get install -y $DEB_JENKINS_INSTALL

 else
    echo "OS NOT DETECTED, couldn't install package $PACKAGE"
    exit 1;
 fi

exit 0
