FROM ubuntu:17.10

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
RUN pip install itzi==17.10

# Copy tutorial files
COPY tutorial.* ./

# download and extract GRASS sample dataset
RUN wget --no-verbose $NC_DATASET_URL/$NC_DATASET_FILE
RUN mkdir grassdata
RUN tar -xf $NC_DATASET_FILE -C grassdata
RUN rm -rf $NC_DATASET_FILE
