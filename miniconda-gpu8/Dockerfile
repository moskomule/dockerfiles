FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
RUN apt-get update -qq && apt-get install -y -qq wget bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/.miniconda \
    && rm miniconda.sh
ENV PATH="/opt/.miniconda/bin:$PATH"
RUN conda install -y -q pytorch torchvision cuda90 -c pytorch \
    && conda install -y -q tqdm ipython \
    && conda clean --all -y -q
