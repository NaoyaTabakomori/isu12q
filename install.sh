#!/bin/sh
set -ex

sudo apt-get install -y dstat unzip graphviz

# alp
cd /var/tmp/ && wget https://github.com/tkuchiki/alp/releases/download/v0.4.0/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv ./alp /usr/local/bin

# pt-query-digest
cd /var/tmp && wget https://www.percona.com/downloads/percona-toolkit/3.0.13/binary/tarball/percona-toolkit-3.0.13_x86_64.tar.gz
tar -zxvf percona-toolkit-3.0.13_x86_64.tar.gz
sudo mv ./percona-toolkit-3.0.13/bin/pt-query-digest /usr/local/bin

