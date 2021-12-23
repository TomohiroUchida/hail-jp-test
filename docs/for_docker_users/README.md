# Running Hail on Docker container

## What are included ?
This container includes ,  
- jupyter lab
- hail
- hail tutorials

## To run the container
### x86_64 
```
docker run -it -p 8888:8888 utut/hail-jp-trial:latest
```
or if you want to access the Spark UI , 
```
docker run -it -p 8888:8888 -p 4040:4040 utut/hail-jp-trial:latest
```

### for arm64 ( If you want to use m1 mac , use this one)
```
docker run -it -p 8888:8888 utut/hail-jp-trial-m1:latest
```
or if you want to access the Spark UI ,
```
docker run -it -p 8888:8888 -p 4040:4040 utut/hail-jp-trial-m1:latest
```

## Access jupyter-lab from your browser !!
- Access jupyter-lab
```
http://localhost:8888
```

You can see tutorials directory on left pane.  
Let's run the GWAS tutorial and others.


## Using Spark UI
Spark UI is available at almost port 4040 ( If you've run the spark multiple times , the port will be 4041 or above.)  
