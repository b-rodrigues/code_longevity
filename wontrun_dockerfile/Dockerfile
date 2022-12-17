FROM ubuntu:jammy

RUN apt-get update && apt-get install -y aptitude

ENV R_VERSION=4.2.2
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC

RUN mkdir /rocker_scripts

COPY install_R_source.sh /rocker_scripts/install_R_source.sh

RUN ["chmod", "+x", "/rocker_scripts/install_R_source.sh"]

RUN /rocker_scripts/install_R_source.sh

ENV CRAN=https://packagemanager.rstudio.com/cran/__linux__/jammy/2022-11-21
ENV LANG=en_US.UTF-8

COPY setup_R.sh /rocker_scripts/setup_R.sh

RUN ["chmod", "+x", "/rocker_scripts/setup_R.sh"]

RUN /rocker_scripts/setup_R.sh

RUN ["R", "CMD", "javareconf"]

RUN aptitude update && \
  DEBIAN_FRONTEND=noninteractive \
  TZ=Europe/Luxembourg \
  aptitude install -y \
  automake \
  bowtie2 \
  bwidget \
  cargo \
  cmake \
  dcraw \
  default-jdk \
  gdal-bin \
  git \
  gsfonts \
  haveged \
  imagej \
  imagemagick \
  jags \
  libapparmor-dev \
  libarchive-dev \
  libcairo2-dev \
  libcurl4-openssl-dev \
  libfftw3-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libfribidi-dev \
  libgdal-dev \
  libgeos-dev \
  libgit2-dev \
  libgl1-mesa-dev \
  libglib2.0-dev \
  libglpk-dev \
  libglu1-mesa-dev \
  libgmp3-dev \
  libgpgme11-dev \
  libgsl0-dev \
  libharfbuzz-dev \
  libhdf5-dev \
  libhiredis-dev \
  libicu-dev \
  libimage-exiftool-perl \
  libjpeg-dev \
  libleptonica-dev \
  libmagick++-dev \
  libmpfr-dev \
  libmysqlclient-dev \
  libnetcdf-dev \
  libnode-dev \
  libopenmpi-dev \
  libpng-dev \
  libpoppler-cpp-dev \
  libpq-dev \
  libproj-dev \
  libprotobuf-dev \
  libquantlib0-dev \
  librdf0-dev \
  librsvg2-dev \
  libsasl2-dev \
  libsecret-1-dev \
  libsndfile1-dev \
  libsodium-dev \
  libsqlite3-dev \
  libssh2-1-dev \
  libssl-dev \
  libtesseract-dev \
  libtiff-dev \
  libudunits2-dev \
  libwebp-dev \
  libxft-dev \
  libxml2-dev \
  libxslt-dev \
  libzmq3-dev \
  make \
  nvidia-cuda-dev \
  ocl-icd-opencl-dev \
  pandoc \
  pandoc-citeproc \
  pari-gp \
  perl \
  pkg-config \
  protobuf-compiler \
  python3 \
  rustc \
  saga \
  tcl \
  tesseract-ocr-eng \
  texlive \
  tk \
  tk-dev \
  tk-table \
  unixodbc-dev \
  zlib1g-dev

RUN R -e "install.packages('remotes')"

RUN R -e "remotes::install_github('b-rodrigues/wontrun', ref = 'master')"

CMD ["R"]
