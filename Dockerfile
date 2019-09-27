#ENTRYPOINT ["/bin/bash", "-c", "pwd > m.txt"]
FROM ubuntu:16.04

COPY . /

WORKDIR /
ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["touch", "b.txt"]
#CMD ["ls"]
#CMD ["ls"]
#CMD ["sleep", "20"]
#CMD ["pwd"]
CMD ["./run.sh"]


#the below works
#FROM ubuntu:16.04

#ADD . /

#WORKDIR workspace/ebensman/minik/minik
#ENTRYPOINT ["/bin/bash"]
#ADD . /workspace/
#CMD ["./run.sh"]