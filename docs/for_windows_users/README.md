# Hail on Windows OS
Windows OS is not supported officially , but you can run GWAS tutorial on your windows PC using WSL2 or Docker Desktop.
Otherwise you will fail because of using C: based file access.


!! Note that, You might need a additional subsucription for using docker desktop. Please check the licenses.

## Trying Hail using Dokcer container
### Install Docker Desktop on your windows PC  
There are many information all over the world to install Docker Desktop.  
I provided "Installing Docker Desktop on clean installed win10Pro" video as below youtube movie.  
It include the simplest way.  

https://youtu.be/yQdmN7H9KBg

### Next: Run the docker container and access jupyter-lab   
After working Docker desktop , you can run the 'hail-jp trial container'.  
Prease reade the docs below.  

[Running Hail on Docker container](../for_docker_users/README.md) 


Enjoy! 

## Trying Hail using WSL2(Windows subsystem for Linux 2)  
### Install WSL2 on your windows PC
There are also many information all over the world to install WSL2.  
Basically installing WSL2 is very easy.  
I provided "Installing Windows Subsystem for Linux on clean win10Pro" video as below youtube movie.
It include the simplest way.

https://youtu.be/QaIaSAqTqFo

### Next: After get Ubuntu 20.04LTS on your Windows PC by WSL2 
 - Install java8 , pip3

```
sudo apt update
sudo apt install openjdk-8-jre-headless
sudo apt install python3-pip
sudo apt install wget
```
 - Install hail and jupyterlab
```
pip3 install hail
pip3 install jupyterlab
```

 - Get tutorials from hail docs
```
cd

wget https://hail.is/docs/0.2/tutorials.tar.gz
 or 
curl -O https://hail.is/docs/0.2/tutorials.tar.gz

tar xvf tutorials.tar.gz
# Caution! the file is not gzipped , so we should run tar with 'xvf'
```

 - Run the Jupyter lab 
```
re-login to WSL

cd
jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''
```````

 - Access to Jupyter lab  

enter the URL on your browser address bar
```
http://localhost:8888
```

You will see the tutorials in the left pane of the Jupyter lab.  

Enjoy!!


