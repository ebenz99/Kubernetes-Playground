FROM ubuntu:16.04

ADD . /

#WORKDIR /workspace/
#ENTRYPOINT ["/bin/bash", "-c", "pwd > m.txt"]
#CMD ["pwd"]


#the below works
#FROM ubuntu:16.04

#ADD . /

#WORKDIR workspace/ebensman/minik/minik
#ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["./run.sh"]