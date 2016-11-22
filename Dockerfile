FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y graphviz

USER main



RUN wget -O dipde.zip https://github.com/nicain/dipde_dev/archive/Janelia_2016.zip
RUN unzip dipde.zip
RUN pip install ./dipde_dev-Janelia_2016

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt