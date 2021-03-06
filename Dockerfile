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

# Runner for k8s
RUN printf "#!/bin/bash\n\
echo \$HOST_IP > /geneweb/gw/only.txt\n\
/geneweb/gwsetup \"\$@\" " > /geneweb/run-gwsetup.sh
RUN chmod +x /geneweb/run-gwsetup.sh
#RUN cat /geneweb/run-gwsetup.sh

# Docker special IP
#ENV HOST_IP 172.17.0.1 
#RUN echo ${HOST_IP} > /geneweb/gw/only.txt

#EXPOSE 2316
#EXPOSE 2317

CMD /geneweb/gwd 
#ENTRYPOINT [ "geneweb/gwd" ]