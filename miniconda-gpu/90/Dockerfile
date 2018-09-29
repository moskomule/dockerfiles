FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
RUN apt-get update -qq && apt-get install -y -qq wget bzip2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
    && bash miniconda.sh -b -p /opt/.miniconda \
    && rm miniconda.sh
ENV PATH="/opt/.miniconda/bin:$PATH"
RUN conda install -y -q pytorch torchvision cuda90 -c pytorch \
    && pip install tqdm ipython \
    && conda clean --all -y -q

# Install PillowSIMD+libjpeg-turbo on Conda 
# https://gist.github.com/soumith/01da3874bf014d8a8c53406c2b95d56b
RUN mkdir temp && cd temp \
    && mkdir -p $HOME/.local
    && conda uninstall --force pillow -y \
    && git clone https://github.com/libjpeg-turbo/libjpeg-turbo \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$HOME/.local \
    && make \
    && make install \
    && cd .. \
    && git clone https://github.com/uploadcare/pillow-simd \
    && CPATH=$HOME/.local/include LIBRARY_PATH=$HOME/.local/lib CC="cc -mavx2" python setup.py install \
    && cd .. && rm -rf temp
