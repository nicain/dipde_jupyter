FROM andrewosh/binder-base

MAINTAINER Nicholas Cain <nicholasc@galleninstitute.org>

USER root

# Add dependency
RUN apt-get update
#RUN apt-get install -y libqt4-dev qt4-qmake
RUN apt-get install -y xvfb

#RUN dpkg -L xvfb


#RUN /etc/init.d/xvfb start
#RUN sleep 3 # give xvfb some time to start


#ADD xvfb.init /etc/init.d/xvfb
#RUN chmod +x /etc/init.d/xvfb
#RUN update-rc.d xvfb defaults
#CMD (service xvfb start; export DISPLAY=:99.0; echo OK)

#ENV DISPLAY :99.0
#RUN /usr/bin/Xvfb :99 &
USER main
#RUN service xvfb start
#RUN export DISPLAY=:99.0
RUN pip install https://github.com/nicain/dipde_dev/zipball/Janelia_2016
RUN /usr/bin/xvfb-run py.test /home/main/anaconda2/lib/python2.7/site-packages/dipde/test

#USER root




# Install requirements for Python 2
#ADD requirements.txt requirements.txt
#RUN pip install -r requirements.txt