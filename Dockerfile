FROM ubuntu:16.04
#FROM python:3
#FROM continuumio/anaconda3
#RUN conda install numpy

ADD . /workspace/ebensman/minik/


WORKDIR /workspace/ebensman/minik/


#RUN pwd
#ENTRYPOINT ["/bin/bash"]
#CMD ["cd","workspace/ebensman/minik/"]

CMD ["./run.sh"]


#CMD ["./run.sh"]


#RUN /bin/bash -c './run.sh'
#CMD ["python", "app.py","1"]
