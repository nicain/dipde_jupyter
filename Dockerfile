FROM andrewosh/binder-base

MAINTAINER Nicholas Cain <nicholasc@galleninstitute.org>

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y graphviz

USER main


RUN pip install https://github.com/nicain/dipde_dev/zipball/Janelia_2016

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt