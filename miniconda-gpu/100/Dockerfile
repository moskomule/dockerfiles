FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
RUN apt-get update -qq && apt-get install -y -qq \
    bzip2 \
    build-essential \
    cmake \
    curl \
    gcc \
    git \
    nasm \
    neovim \
    ruby \
    rsync \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/.miniconda \
    && rm miniconda.sh
ENV PATH="/opt/.miniconda/bin:$PATH"
RUN conda install -y -q pytorch torchvision cudatoolkit=10.0 -c pytorch \
    && pip install tqdm ipython glances neovim nvidia-ml-py3\
    && conda clean --all -y -q

