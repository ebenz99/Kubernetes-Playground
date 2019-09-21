FROM ubuntu:16.04
#FROM python:3
#FROM continuumio/anaconda3
#RUN conda install numpy

ADD . /


WORKDIR .
#RUN pwd
ENTRYPOINT ["/bin/bash"]
CMD ["./run.sh"]