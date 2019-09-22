FROM ubuntu:16.04

ADD . /

WORKDIR /workspace/
#ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["cd", "workspace"]
#RUN cd workspace
#RUN sleep 10
#RUN pwd > n.txt
ENTRYPOINT ["/bin/bash", "-c", "pwd > m.txt"]

#the below works
#FROM ubuntu:16.04

#ADD . /

#WORKDIR workspace/ebensman/minik/minik
#ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["./run.sh"]