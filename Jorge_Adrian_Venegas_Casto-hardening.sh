#!/bin/bash

 lsb_release -d

#Control de flujo: case
echo "Seleccione su SO"
echo "1 ubuntu"
echo "2 centOS"
read SO
case $SO in
  1)
  clear
    echo "ubuntu"
    sudo systemctl restart clamav-daemon
    sudo apt-get remove clamav 
    sudo apt install clamav
    sudo service clamav-freshclam restart
    sudo service clamav-freshclam status
    sudo apt-get update
    
  ;;
  2)
  clear
    	echo "centos"
    	sudo service clamd stop
    	sudo yum remove 'clamav*'
	sudo dnf install epel-release -y
	sudo dnf install clamav -y
	sudo dnf install clamd -y
	sudo dnf install clamav clamd clamav-update -y
	sudo setsebool -P antivirus_can_scan_system 1
	sudo freshclam
	sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
	sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(arch)-rpms"
	sudo yum check-update
    
  ;;
  *)
  clear
  echo "otro"
esac
