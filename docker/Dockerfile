FROM tiangolo/python-machine-learning:python3.7
# Or variant:
# FROM tiangolo/python-machine-learning:cuda9.1-python3.6-tensorflow
# More information about this docker image can be found here:
# https://github.com/tiangolo/python-machine-learning-docker

# Set LTU as the maintainer
LABEL maintainer "Dat'Apero"

ENV DEBIAN_FRONTEND noninteractive

# Switch to root user
USER root

RUN apt-get update --assume-yes

# Update CONDA to latest version
RUN conda update -n base -c defaults conda

# Install python modules available threw CONDA
ADD ./requirements-conda.txt /tmp/requirements-conda.txt
RUN conda install --file /tmp/requirements-conda.txt && rm /tmp/requirements-conda.txt


# Install python modules ONLY available threw PIP
ADD ./requirements-pip.txt /tmp/requirements-pip.txt
RUN pip install -r /tmp/requirements-pip.txt && rm /tmp/requirements-pip.txt

# For Jupyter notebook and matplotlib integration
# Install notejs
RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter lab build

# Upgrade all packages
# RUN conda upgrade --all

ADD config_files/prompt_header.txt /tmp/prompt_header.txt
ADD config_files/bashrc /tmp/.bashrc.custom

RUN echo "source /tmp/.bashrc.custom" >> ~/.bashrc

WORKDIR /source

CMD bash