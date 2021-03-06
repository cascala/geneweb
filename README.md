# geneweb
Docker file for geneweb:
https://github.com/geneweb/geneweb


## TL;DR;
To run the main server locally:
``` sh
docker run --publish 2317:2317 -v /home/<user>/gwdb:/geneweb/bases geneweb:version-7.0.0 
```
You can use another path instead of /home/`<user`>/gwdb, of course.

To run the setup server locally:
(You should only have to do this occasionally, or initially)
``` sh
docker run --publish 2316:2316 -v /home/<user>/gwdb:/geneweb/bases geneweb:version-7.0.0 bash -c "/geneweb/run-gwsetup.sh -lang en"
```

To stop the running container:
First get the name of the running container(s), using
``` sh
docker container ls 
```
or,
``` sh
docker ps
```
Then use the docker kill command with the name of the relevant container:
``` sh
docker kill <container name>
```
## Appendix - advanced uses

To build the image yourself:
``` sh
docker build . --tag geneweb:version-7.0.0
```

To run an interactive shell inside the container (get the container name as indicated earlier)
``` sh
docker exec -it <container name> /bin/bash
```

To publish the image to a registry (most users won't ever need to do this):
``` sh
docker tag geneweb:<version> localhost:32000/geneweb:<version>
docker push geneweb:32000/geneweb:<version>
```

For instance:
``` sh
docker tag geneweb:latest localhost:32000/geneweb:latest
docker push geneweb:32000/geneweb:latest
```
or
``` sh
docker tag geneweb:v7.0.0 localhost:32000/geneweb:v7.0.0
docker push geneweb:32000/geneweb:v7.0.0
```

