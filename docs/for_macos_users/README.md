# Hail on MacOS
You can run Hail on your MacOS machine by building environments.

or..

You can also run it using Docker Desktop.
!! Note that, You might need a additional subsucription for using docker desktop. Please check the licenses.

## Trying Hail using Dokcer container
### Install Docker Desktop on your mac 
Download proper link ( Mac with Intel Chip / Mac with Apple Chip) and install it.   
https://www.docker.com/products/docker-desktop

### Next: Run the docker container and access jupyter-lab   
After working Docker desktop , you can run the 'hail-jp trial container'.  
Prease reade the docs below.  

[Running Hail on Docker container](../for_docker_users/README.md) 


Enjoy! 


## Trying Hail using your self-build environment on Intel Chip Mac
There are many way to fill the requirement.
For example , we can install java from  oepnjdk  , AdoptOpenJDK, Zule and Oracle JDK.  
And we can install them using downloaded package or via package manager such as homebrew.  

The example below is one of the simple way to show you. 

- java8:  install zulu8 using homebrew
- python environment: install python-3.9.7 using miniforge
- hail / jupyter-lab : install using python pip

### How to build Hail environment on Intel Mac
- homebrew
- java8

```
% brew install homebrew/cask-versions/zulu8
```
- miniforge and python
```
% curl https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-x86_64.sh -OL
% bash Miniforge3-MacOSX-x86_64.sh 

```
- hail and jupyter lab
```
% pip3 install hail jupyterlab
```



## Trying Hail using your self-build environment on Apple Chip(M1) Mac
M1 mac is quite a new environment ,so it is a little dificult to do it.  
But this way ,   you that you can install and running Hail tutorials.

### How to build Hail environment on M1 Mac
- java8  

```
% brew install homebrew/cask-versions/zulu8
```
- miniforge
```
% curl https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh -OL
% bash Miniforge3-MacOSX-arm64.sh 
```

- python , hail and jupyter lab  
```
% pip3 install hail jupyterlab
```


## Get the Hail tutorials from hail docs and run it.

- Get notebooks  
```
% curl -O https://hail.is/docs/0.2/tutorials.tar.gz
% tar xvf tutorials.tar.gz 
```

- run jupyter lab  
```
% jupyter-lab --ip=0.0.0.0 --no-browser --NotebookApp.token=''
```
- Access to Jupyter lab  
enter the URL on your browser address bar  

http://localhost:8888  

You will see the tutorials in the left pane of the Jupyter lab.

Enjoy!!


