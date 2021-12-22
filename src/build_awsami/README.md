# Hail-jp trial on AWS

## Building a AWS AMI
```
cd packer
./build-wrapper.sh --ut-version 0.0.1 --subnet-id subnet-xxxxxxxxxxxxxxxxx --subnet-type private --instance-profile-name oooooom-role 
```

You will see the new AMI on your EC2 dashbord.  
Run it with proper setting.  
You should pass the arival port 8000 for jupyter lab.


## What are included ?
This container includes ,  
- Minimal installed jupyter-hub by miniforge
- hail
- hail tutorials

## Access jupyter-hub from your browser !!
- Access jupyter-hub
```
http://"IP Address of the instance":8000
```



You can see tutorials directory on left pane.  
Let's run the GWAS tutorial and others.
