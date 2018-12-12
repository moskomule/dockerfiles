FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
RUN apt-get update -qq && apt-get install -y -qq \
    bzip2 \
    cmake \
    git \
    gcc \
    nasm build-essential \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/.miniconda \
    && rm miniconda.sh
ENV PATH="/opt/.miniconda/bin:$PATH"
RUN conda install -y -q pytorch torchvision cuda100 -c pytorch \
    && pip install tqdm ipython \
    && conda clean --all -y -q

