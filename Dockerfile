from ubuntu:18.04 

# Tool requirements
RUN apt update
RUN apt install -y unzip
RUN apt install -y wget

WORKDIR /
RUN wget -c http://github.com/geneweb/geneweb/releases/download/v7.0.0/geneweb-linux-88536ed4.zip 
RUN unzip geneweb-linux-88536ed4.zip
RUN rm geneweb-linux-88536ed4.zip
RUN mv distribution geneweb
#WORKDIR /geneweb

# Docker special IP
ENV DOCKER_IP 172.17.0.1 
RUN echo ${DOCKER_IP} > /gw/only.txt

#EXPOSE 2316
#EXPOSE 2317

CMD /geneweb/gwd 
#ENTRYPOINT [ "geneweb/gwd" ]