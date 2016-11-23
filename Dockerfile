FROM andrewosh/binder-base

MAINTAINER Nicholas Cain <nicholasc@galleninstitute.org>

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y libqt4-dev qt4-qmake
RUN apt-get install -y xvfb
ENV DISPLAY :99.0
RUN sudo sh -e /etc/init.d/xvfb start
RUN sleep 3 # give xvfb some time to start

#USER main
#RUN pip install https://github.com/nicain/dipde_dev/zipball/Janelia_2016

#USER root


#RUN py.test /home/main/anaconda2/lib/python2.7/site-packages/dipde/test

# Install requirements for Python 2
#ADD requirements.txt requirements.txt
#RUN pip install -r requirements.txt