#!/bin/bash

#Author : Zengue Viany

echo "Vous vous préparez à installer Sonarqube . Voulez-vous vraiment continuer ?"
read con

if [ $con -eq "n" ]
then 
    echo "See you later !"
else
    echo "Debut d'installation ..."
    sleep 1

    echo "Step 1 : System Updating ..."
    sudo yum update -y
    sleep 1

    echo "Step 2 : Java-11 installation ..."
    sudo yum install java-11-openjdk-devel -y
    cd /opt
    sudo yum install wget
    sleep 1

    echo "Downloading of sonarqube9 ..."
    sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
    sleep 1
    
    echo "Installation of unzip ..."
    sudo yum install unzip
    sleep 1

    echo "Unziping sonarqube ..."
    sudo unzip /opt/sonarqube-9.3.0.51899.zip
    cd sonarqube-9.3.0.51899
    sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
    cd sonarqube-9.3.0.51899/bin/linux-x86-64
    sleep 1

    echo "starting sonarqube"
    ./sonar.sh start
    sleep 1
    echo "done"

fi
