FROM osgeo/grass-gis:8.4.1-ubuntu

ENV NC_DATASET_URL=https://grass.osgeo.org/sampledata/north_carolina
ENV NC_DATASET_FILE=nc_spm_08_grass7.zip

# install dependencies
RUN apt-get update && apt-get install -y \
clang \
libomp-dev \
unzip \
wget
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# install itzi
RUN uv tool install itzi==25.4
RUN uv tool update-shell
# For some reason, the first install in docker does not include OPenMP
RUN uv tool install --reinstall itzi==25.4

# Copy tutorial files
COPY tutorial* ./

# download and extract GRASS sample dataset
RUN wget --no-verbose $NC_DATASET_URL/$NC_DATASET_FILE
RUN mkdir grassdata
RUN unzip $NC_DATASET_FILE -d grassdata
RUN rm -rf $NC_DATASET_FILE
