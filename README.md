# geneweb
Docker file for gene web

To build:
docker build . --tag geneweb:version-7.0.0

To run the main server locally:
docker run --publish 2317:2317 -v /home/<user>/gwdb:/geneweb/bases geneweb:version-7.0.0 

To run the setup server locally:
(You should only have to do this occasionally, or initially)
docker run --publish 2316:2316 -v /home/<user>/gwdb:/geneweb/bases geneweb:version-7.0.0 bash -c "./gwsetup -lang en"

To stop the running container:
First get the name of the running container(s), using
docker container ls 
or,
docker ps
docker kill 

To run an interactive shell inside the container:
First get the 
docker exec -it <container name> /bin/bash

To publish (only run this on the host which runs a docker registry on port 32000)
docker tag geneweb:<version> localhost:32000/geneweb:<version>
docker push geneweb:32000/geneweb:<version>

For instance:
docker tag geneweb:latest localhost:32000/geneweb:latest
docker push geneweb:32000/geneweb:latest
or
docker tag geneweb:v7.0.0 localhost:32000/geneweb:v7.0.0
docker push geneweb:32000/geneweb:v7.0.0

