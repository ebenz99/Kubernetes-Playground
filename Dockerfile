#ENTRYPOINT ["/bin/bash", "-c", "pwd > m.txt"]



ADD . /
WORKDIR /workspace/
ENTRYPOINT ["/bin/bash", "-c", "pwd > m.txt"]


#FROM ubuntu:16.04
#COPY . /workspace
#WORKDIR /workspace
#ENTRYPOINT ["/bin/bash"]
#CMD ["./run.sh"]


#the below works
#FROM ubuntu:16.04

#ADD . /

#WORKDIR workspace/ebensman/minik/minik
#ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["./run.sh"]