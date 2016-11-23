FROM andrewosh/binder-base

MAINTAINER Nicholas Cain <nicholasc@galleninstitute.org>

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y graphviz

USER main


RUN pip install https://github.com/nicain/dipde_dev/zipball/Janelia_2016
RUN pip install -r requirements.txt

RUN "export DISPLAY=:99.0"
RUN "sh -e /etc/init.d/xvfb start"
RUN sleep 3 # give xvfb some time to start
RUN py.test /home/main/anaconda2/lib/python2.7/site-packages/dipde/test

# Install requirements for Python 2
#ADD requirements.txt requirements.txt
#RUN pip install -r requirements.txt