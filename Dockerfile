FROM ubuntu:16.10

ENV NC_DATASET_URL https://grass.osgeo.org/sampledata/north_carolina
ENV NC_DATASET_FILE nc_spm_08_grass7.tar.gz

# install the softwares
RUN apt-get update && apt-get install -y \
grass-core \
grass-dev \
gzip \
python-pip \
tar \
wget

RUN pip install --disable-pip-version-check --upgrade pip
RUN pip install itzi

# create user
RUN groupadd -r itzi
RUN useradd -s /bin/bash -m -g itzi itzi-user
WORKDIR /home/itzi-user

# Copy tutorial files
COPY tutorial.* ./
RUN chown itzi-user:itzi ./tutorial.*

# change to user
USER itzi-user

# download and extract GRASS sample dataset
RUN wget --no-verbose $NC_DATASET_URL/$NC_DATASET_FILE
RUN mkdir grassdata
RUN tar -xf $NC_DATASET_FILE -C grassdata
RUN rm -rf $NC_DATASET_FILE