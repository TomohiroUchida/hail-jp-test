#!/bin/bash
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge-pypy3-Linux-x86_64.sh
sudo bash Miniforge-pypy3-Linux-x86_64.sh -p /usr/local/miniforge3 -b
sudo /usr/local/miniforge3/bin/conda init
sudo -i conda install -y python==3.8.10
sudo -i pip install jupyterhub environment_kernels notebook jupyterlab
sudo -i conda install -y configurable-http-proxy 
sudo -i jupyterhub --generate-config
sudo mkdir /etc/jupyterhub
sudo mv /root/jupyterhub_config.py /etc/jupyterhub/
sudo mkdir /var/lib/jupyterhub/

sudo tee /etc/sysconfig/jupyterhub <<EOF >> /dev/null
JAVA_HOME=/usr/java/default
EOF

sudo tee /etc/systemd/system/jupyterhub.service <<EOF >> /dev/null 
[Unit]
Description=Jupyterhub

[Service]
User=root
EnvironmentFile=/etc/sysconfig/jupyterhub
Environment="PATH=/usr/local/miniforge3/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin"
ExecStart=/usr/local/miniforge3/bin/jupyterhub --no-ssl -f /etc/jupyterhub/jupyterhub_config.py --log-file /var/log/jupyterhub.log --db=/var/lib/jupyterhub/jupyterhub.sqlite 

WorkingDirectory=/etc/jupyterhub

[Install]
WantedBy=multi-user.target

EOF


sudo -i systemctl daemon-reload
sudo -i systemctl enable  jupyterhub.service
sudo -i systemctl start  jupyterhub.service

sudo -i yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
sudo -i yum install -y gcc

##
#sudo -i yum -y install https://vault.centos.org/6.10/os/x86_64/Packages/atlas-3.8.4-2.el6.x86_64.rpm
#sudo -i yum -y install https://vault.centos.org/6.10/os/x86_64/Packages/atlas-devel-3.8.4-2.el6.x86_64.rpm
## or it might be OK
sudo -i conda install -y blas
##

#sudo -i  yum install -y lapack-devel lapack openblas-devel openblas-devel
sudo -i conda install -y rust 
sudo -i pip install hail

#sudo -i  wget https://hail.is/docs/0.2/tutorials.tar.gz
sudo -i tar xzf /tmp/tutorials.tar.gz
sudo -i mv tutorials /etc/skel/
sudo -i rm /tmp/tutorials.tar.gz -fr

# Creating the test user
for i in `seq -w 1 100`
do
  sudo adduser testuser$i
  sudo echo "testuser$i:testuserpasswd$i" |sudo chpasswd
done


