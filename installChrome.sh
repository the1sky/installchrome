#!/bin/sh
cat /etc/issue | grep CentOS
if [ $? -eq 0 ]; then
    wget http://chrome.richardlloyd.org.uk/install_chrome.sh
    chmod +x install_chrome.sh
    sh install_chrome.sh
fi


cat /etc/issue | grep Ubuntu
if [ $? -eq 0 ]; then
    base_url='http://pagetimeline.duapp.com/browser/ubuntu/'
    prefix='google-chrome-stable_current'
    suffix='.deb'
    cd /tmp
    arch=`uname -m`
    if [ $arch == 'x86_64' ]; then
        chrome_url=${base_url}${prefix}_amd64${suffix}
    else
        chrome_url=${base_url}${prefix}_i386${suffix}
    fi
    wget $chrome_url
    sudo dpkg -i google-chrome*
    apt-get -f install
fi