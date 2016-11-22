#
# dipde Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
# https://github.com/nicain/dipde_dev

# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget

RUN \
  apt-get install libqt4-dev qt4-qmake && \
  wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh && \ 
  chmod +x miniconda.sh && \
  ./miniconda.sh -b && \
  export PATH=/home/main/miniconda2/bin:$PATH && \
  conda update --yes conda

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]