FROM ubuntu:16.04
#FROM python:3
#FROM continuumio/anaconda3
#RUN conda install numpy

ADD . /


WORKDIR .
#RUN pwd
CMD ["touch", "a.txt"]
CMD ["sleep", "80"]
#CMD ["python", "app.py","1"]
