# hail-jp-trial


## for x86_84

### If you can use sudo 
```
% sudo apt update -y
% sudo apt install python3-pip openjdk-8-jre-headless wget -y 
% python3 --version
Python 3.8.10
% java -version
openjdk version "1.8.0_312"
OpenJDK Runtime Environment (build 1.8.0_312-8u312-b07-0ubuntu1~20.04-b07)
OpenJDK 64-Bit Server VM (build 25.312-b07, mixed mode)
% sudo  pip3 install hail jupyterlab
% wget https://hail.is/docs/0.2/tutorials.tar.gz
% tar xvf tutorials.tar.gz
% jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''


```

### If you can't use sudo , install under your home directory

```
% wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
% bash Miniforge3-Linux-x86_64.sh 

##execute bash / or re-login

(base) ~$ python --version
Python 3.9.7

(base) ~$ conda install openjdk==8.0.312
(base) ~$ java -version
openjdk version "1.8.0_312"
OpenJDK Runtime Environment (Zulu 8.58.0.13-CA-linux64) (build 1.8.0_312-b07)
OpenJDK 64-Bit Server VM (Zulu 8.58.0.13-CA-linux64) (build 25.312-b07, mixed mode)

(base) ~$ pip3 install hail jupyterlab

(base) ~$ wget https://hail.is/docs/0.2/tutorials.tar.gz

(base) ~$ tar xvf tutorials.tar.gz

(base) ~$ jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''

```


## for arm64
### If you can use sudo
```
% sudo apt install -y default-jre gcc
% sudo apt install -y g++

% wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh
% sudo  bash Miniforge3-Linux-aarch64.sh 
### I choose install location as /usr/local/miniconda3
### [/root/miniforge3] >>> /usr/local/miniforge3

% sudo -i /usr/local/miniforge3/bin/pip3 install jupyterlab hail

% wget https://hail.is/docs/0.2/tutorials.tar.gz
% tar xvf tutorials.tar.gz
% jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''
```


### If you can't use sudo , install under your home directory
```
% wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh
% bash Miniforge3-Linux-aarch64.sh 

##execute bash / or re-login

% conda install -y openjdk=8.0.312
% conda install -y gcc=9.4 gxx=9.4
## Because Hail call old pandas==1.1.4 , the newest compiler can't build it.

% pip3 install hail
% pip3 install jupyterlab

% wget https://hail.is/docs/0.2/tutorials.tar.gz
% tar xvf tutorials.tar.gz
% jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''
```


