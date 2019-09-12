FROM python:3
FROM continuumio/anaconda3
RUN conda install numpy

ADD . /


WORKDIR /app

#CMD ["python", "app.py","1"]
